

module alice
#(
	parameter INITIAL_LONG_KEY = 130
)
(
	//user input
	input wire transmit_req, //done
	input wire [127:0] data_in, //done
	input wire data_stb, //done
	input wire usr_long_key_ch, //done

	//user_output
	output wire ready_for_transmit, //done
	output wire ready, //done
	output wire usr_long_key_valid, //done
	output wire usr_long_key_change_rq,//done

	//CC input
	input wire [7:0] password, //done

	//DH
	output wire [127:0] alice_dh_data, //done
	output wire alice_dh_data_valid, //done

	input wire [127:0] bob_dh_data, //done
	input wire bob_dh_data_valid, //done

	//alice data
	output wire [127:0] alice_data, //done
	output wire alice_data_valid, //done

	//bob state pins
	input wire o_stb, //done

	//system pins  
	input wire clk,
	input wire reset
);
localparam WAIT_TRANSMIT_REQ = 0;
localparam KEY_GENERATION = 1;
localparam TRANSMITION = 2;
localparam LONG_KEY_CH = 3;
///////////////////////////////////////////////////////////////////////////////REG_WI/////////////////////////////////////////////////////////////////////////
//CC
reg cc_sgn_key_ch;
reg [127:0] cc_key_in;

wire cc_key_val;
wire [127:0] cc_key_out;

reg cc_change_rq;

//encryptor
wire [127:0] en_datain;
wire en_dat_stb; 
  
//wire en_key;
//wire en_key_valid; 
 
wire en_o_stb; 
 
wire en_o_valid; 
wire [127:0] en_dataout; 
wire en_ready;

//decryptor
wire [127:0] dec_datain;
wire dec_dat_stb;

//wire dec_key;
//wire dec_key_valid;

wire dec_o_stb;

wire dec_o_valid;
wire [127:0] dec_dat_out;
//wire [63:0] dec_dat_out_little;
wire dec_ready;

//dh
//wire [63:0] dh_in_key;
wire dh_in_key_valid;
 
wire [63:0] dh_out_key; 
wire dh_out_key_valid; 
 
wire [127:0] dh_key;
wire dh_key_valid;

//counter
wire long_key_update;

wire ready_stop;
reg stop;

///////////////////////////////////////////////////////////////////////////////MODULE_STATE/////////////////////////////////////////////////////////////////////////
reg [1:0] module_state;

always @(posedge clk)
	if (reset)
		module_state <= WAIT_TRANSMIT_REQ;
	else
		case (module_state)
			WAIT_TRANSMIT_REQ: 
				if (transmit_req & cc_key_val)
					module_state <= KEY_GENERATION;
				else
					module_state <= module_state;
			KEY_GENERATION:
				if (dh_key_valid)
					module_state <= TRANSMITION;
				else
					module_state <= module_state;
			TRANSMITION:
				if (long_key_update)
					module_state <= LONG_KEY_CH;
				else
					module_state <= module_state;
			LONG_KEY_CH:
				if (cc_key_val && !cc_change_rq)
					module_state <= WAIT_TRANSMIT_REQ;
				else
					module_state <= module_state;
			default: 
				module_state <= module_state;
		endcase
///////////////////////////////////////////////////////////////////////////////KEY_UPDATE///////////////////////////////////////////////////////////////////////////
reg [127:0] current_key;
reg current_key_valid;

always @(posedge clk)
	if (reset)
		current_key <= 'b0;
	else if ((module_state == WAIT_TRANSMIT_REQ) && cc_key_val & transmit_req)
		current_key <= cc_key_out;
	else if ((module_state == KEY_GENERATION) && dh_key_valid)
		current_key <= dh_key;
	else
		current_key <= current_key;

always @(posedge clk)
	if (reset)
		current_key_valid <= 1'b0;
	else if ((module_state != KEY_GENERATION) && cc_key_val)
		current_key_valid <= 1'b1;
	else if ((module_state == KEY_GENERATION) && (dh_key_valid || cc_key_val))
		current_key_valid <= 1'b1;
	else if ((module_state == TRANSMITION) && long_key_update)
		current_key_valid <= 1'b0;
	else
		current_key_valid <= current_key_valid;
///////////////////////////////////////////////////////////////////////////////OUT_BOB///////////////////////////////////////////////////////////////////////////
assign alice_dh_data = en_dataout;
assign alice_dh_data_valid = ((module_state == KEY_GENERATION) && en_o_valid);
assign alice_data = en_dataout;
assign alice_data_valid = (module_state == TRANSMITION) && en_o_valid;
///////////////////////////////////////////////////////////////////////////////OUT_USR///////////////////////////////////////////////////////////////////////////
assign ready_for_transmit = (module_state == WAIT_TRANSMIT_REQ);
assign ready = (module_state == TRANSMITION) && en_ready && !stop;
///////////////////////////////////////////////////////////////////////////////ENCRYPTOR/////////////////////////////////////////////////////////////////////////
assign en_datain = (module_state == KEY_GENERATION) ? dh_out_key : data_in;
assign en_dat_stb = (module_state == KEY_GENERATION) ? dh_out_key_valid : ((module_state == TRANSMITION) && data_stb);
assign en_o_stb = ((module_state == KEY_GENERATION) && dh_key_valid) || ((module_state == TRANSMITION) && o_stb); //После генерации сеансового ключа освобождаем encr для новой генерации

AES_encryptor AES_encryptor
(
	.clk(clk),
	.reset(reset),
 
	.datain(en_datain), //done
	.dat_stb(en_dat_stb), //done
 
	.key(current_key), //done
	.key_valid(current_key_valid), //done
 
	.o_stb(en_o_stb), //done
	 
	.o_valid(en_o_valid), //done
	.dataout(en_dataout), //done
	.ready(en_ready) //done
);
///////////////////////////////////////////////////////////////////////////////DECRYPTOR/////////////////////////////////////////////////////////////////////////
assign dec_o_stb = (module_state == KEY_GENERATION) && dh_key_valid;
assign dec_datain = bob_dh_data;
assign dec_dat_stb = (module_state == KEY_GENERATION) && bob_dh_data_valid;

AES_decryptor AES_decryptor
 (
 	.clk(clk),
 	.reset(reset),
  
 	.datain(dec_datain), //done
 	.dat_stb(dec_dat_stb), //done
  
 	.key(current_key), //done
 	.key_valid(current_key_valid), //done
  
	.o_stb(dec_o_stb), //done
 
	.o_valid(dec_o_valid), //done
	.dataout(dec_dat_out), //done
	.ready(dec_ready) //done
);
///////////////////////////////////////////////////////////////////////////////DH/////////////////////////////////////////////////////////////////////////
wire [3:0] secret_key;
container_a container_a
(
	.clk(clk),
	.key_change(transmit_req),
	.abonents_secret(secret_key)
);

assign dh_in_key_valid = (module_state == KEY_GENERATION) && dec_o_valid;

diffi_helman diffi_helman
(
	.clk(clk),
	.reset(reset),

	.key_change(transmit_req), //done 
	.secret_key(secret_key), //done
 
	.partner_key(dec_dat_out[63:0]), //done
	.val_p(dh_in_key_valid), //done
 
	.my_key(dh_out_key), //done
	.val_my_key(dh_out_key_valid), //done
 
	.K(dh_key), //done
	.val_K(dh_key_valid) //done
);
///////////////////////////////////////////////////////////////////////////////CC/////////////////////////////////////////////////////////////////////////
always @(posedge clk)
	if (reset)
		cc_sgn_key_ch <= 1'b0;
	else if (cc_sgn_key_ch)
		cc_sgn_key_ch <= 1'b0;
	else if ((module_state == LONG_KEY_CH) && usr_long_key_ch && cc_change_rq)
		cc_sgn_key_ch <= 1'b1;
	else
		cc_sgn_key_ch <= cc_sgn_key_ch;

always @(posedge clk)
	if (reset)
		cc_key_in <= INITIAL_LONG_KEY;
	else if ((module_state == LONG_KEY_CH) && usr_long_key_ch && cc_change_rq)
		cc_key_in <= cc_key_in + 1;
	else
		cc_key_in <= cc_key_in;

assign usr_long_key_valid = cc_key_val;
assign usr_long_key_change_rq = cc_change_rq;

always @(posedge clk)
	if (reset)
		cc_change_rq <= 1'b0;
	else if ((module_state == LONG_KEY_CH) && usr_long_key_ch && cc_change_rq)
		cc_change_rq <= 1'b0;
	else if ((module_state == TRANSMITION) && long_key_update)
		cc_change_rq <= 1'b1;
	else
		cc_change_rq <= cc_change_rq;

container container
(
	.clk(clk),
	.reset(reset),

	.sgn_key_ch(cc_sgn_key_ch),
	.key_in(cc_key_in),

	.password(password),

	.key_out(cc_key_out),
	.key_val(cc_key_val)
);
///////////////////////////////////////////////////////////////////////////////COUNTER/////////////////////////////////////////////////////////////////////////
counter_4gb counter_4gb
(
	.o_strob(o_stb),
	.clk(clk),
	.reset(reset),
	.answ(long_key_update)
);

always @(posedge clk)
	if(reset)
		stop <= 1'b0;
	else if ((module_state == WAIT_TRANSMIT_REQ) && transmit_req)
		stop <= 1'b0;
	else if (ready_stop)
		stop <= 1'b1;

counter_4gb counter_4gb_in
(
	.o_strob(data_stb),
	.clk(clk),
	.reset(reset),
	.answ(ready_stop)
);


endmodule

































































