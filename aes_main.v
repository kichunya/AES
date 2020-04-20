`timescale 1ns/1ps
/*
`include "/bob/bob.v"
`include "/alice/alice.v"
`include "./encryptor/enKeyGeneration.v"
`include "./encryptor/enmixcolumn.v"
`include "./encryptor/enroundlast.v"
`include "./encryptor/enrounds.v"
`include "./encryptor/ensbox.v"
`include "./encryptor/enshiftrow.v"
`include "./decryptor/KeyGeneration.v"
`include "./decryptor/make_inv_key.v"
`include "./decryptor/MakeKey1.v"
`include "./decryptor/MakeKey2.v"
`include "./decryptor/MakeKey3.v"
`include "./decryptor/MakeKey4.v"
`include "./decryptor/MakeKey5.v"
`include "./decryptor/MakeKey6.v"
`include "./decryptor/MakeKey7.v"
`include "./decryptor/MakeKey8.v"
`include "./decryptor/MakeKey9.v"
`include "./decryptor/MakeKey10.v"
`include "./decryptor/InvMixCol.v"
`include "./decryptor/InvSbox.v"
`include "./decryptor/InvShiftRows.v"
`include "./decryptor/InvSubBytes.v"
`include "./decryptor/InvRound.v"
`include "./decryptor/InvLastRound.v"

`include "/decryptor/AES_decryptor.v"
`include "/encryptor/AES_encryptor.v"
`include "/diffi_helman/diffi_helman.v"
`include "/randomizer/container_b.v"
`include "/counter/counter_4gb.v"

`include "/container/container.v"

`include "/randomizer/container_a.v"
*/


module aes_main(
	input wire clk_in,
	input wire reset,
	input wire reset_clk,
	output wire clk_out,

	//data_in
	input wire data_in_stb,
	input wire data_out_stb,
	input wire [127:0] data_in,
	input wire [7:0] password,

	output wire usr_long_key_valid,
	output wire usr_long_key_change_rq,
	input wire usr_long_key_ch, 	
	
	output wire ready,
	output wire ready_for_transmit,

	//data_out
	output wire [127:0] data_out,
	output wire data_valid
);

wire alice_dh_data_val;
wire [127:0] alice_dh_data;
wire bob_dh_data_val;
wire [127:0] bob_dh_data;

wire ready_for_transmit_A;
wire ready_for_transmit_B;

wire [127:0] data_out_A_to_B;
wire data_out_A_to_B_val;

wire o_stb_B_to_A;
wire ready_B;


wire clk;
reg transmit_req;

wire usr_long_key_valid_A;
wire usr_long_key_valid_B;
wire usr_long_key_change_rq_A;
wire usr_long_key_change_rq_B;
wire usr_long_key_ch_A;
wire usr_long_key_ch_B;

assign usr_long_key_ch_A = usr_long_key_ch;
assign usr_long_key_ch_B = usr_long_key_ch;


//assign clk_in = clk;
assign usr_long_key_valid = usr_long_key_valid_A && usr_long_key_valid_B;
assign usr_long_key_change_rq = usr_long_key_change_rq_A && usr_long_key_change_rq_B;
assign ready_for_transmit = ready_for_transmit_A && ready_for_transmit_B;
assign clk_out = clk;



always @(posedge clk)
begin
	if (reset)
		transmit_req <= 1'b1;
	else if (ready_for_transmit_A && ready_for_transmit_B)
		transmit_req <= 1'b1;
	else 
		transmit_req <= 1'b0;
end

bob bob (
	.clk(clk),
	.reset(reset),
	.transmit_req(transmit_req),
	.password(password),
	.alice_dh_data(alice_dh_data),
	.alice_dh_data_valid(alice_dh_data_val),
	.bob_dh_data(bob_dh_data),
	.bob_dh_data_valid(bob_dh_data_val),
	.alice_data(data_out_A_to_B),
	.alice_data_valid(data_out_A_to_B_val),
	.o_stb(o_stb_B_to_A),
	.usr_o_stb(data_out_stb),
	.data(data_out),
	.data_valid(data_valid),
	.usr_long_key_valid(usr_long_key_valid_B),
	.usr_long_key_change_rq(usr_long_key_change_rq_B),
	.usr_long_key_ch(usr_long_key_ch_B),
	.ready_for_transmit(ready_for_transmit_B)
);


alice alice (
	.clk(clk),
	.reset(reset),
	.transmit_req(transmit_req),
	.password(password),
	.alice_dh_data(alice_dh_data),
	.alice_dh_data_valid(alice_dh_data_val),
	.bob_dh_data(bob_dh_data),
	.bob_dh_data_valid(bob_dh_data_val),
	.alice_data(data_out_A_to_B),
	.alice_data_valid(data_out_A_to_B_val),
	.o_stb(o_stb_B_to_A),
	.ready(ready),
	.ready_for_transmit(ready_for_transmit_A),
	.data_stb(data_in_stb),
	.data_in(data_in),
	.usr_long_key_valid(usr_long_key_valid_A),
	.usr_long_key_change_rq(usr_long_key_change_rq_A),
	.usr_long_key_ch(usr_long_key_ch_A)
);

clk16 clk162(
	.clk50(clk_in),
	.reset(reset_clk),
	.clk16(clk)
);
endmodule



