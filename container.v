`timescale 1ns/1ps

module container #(parameter PASSWORD_CHEK = 8'b10101010)(
	input wire 		clk,
	input wire 		reset,
	input wire 		sgn_key_ch,
	input wire [127:0]	key_in,
	
	input wire [7:0] 	password,

	output wire [127:0]	key_out,
	output wire		key_val
);

reg [127:0] 	key;
reg 		license;

always @(posedge clk)
	license <= 		reset ? 1'b0 :
					sgn_key_ch 			? 1'b0 :
		   				(password == PASSWORD_CHEK) 	? 1'b1 : license;	


always @(posedge clk)
	key <= 		reset ? 128'habcd:
				sgn_key_ch ? key_in : key;

assign	key_out =   reset	? 128'b0 	:
		    license     ? key 		: 128'b0;


assign key_val  =   reset 	? 1'b0  :
		    sgn_key_ch  ? 1'b0  :
		    license 	? 1'b1 	: 1'b0;
	

endmodule
