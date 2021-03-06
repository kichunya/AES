`timescale 10ns/1ns

module container_b(
	input wire key_change,
	input wire clk,
	output wire [3:0] abonents_secret
);

reg [3:0] secret = 4'b1010;

always @(posedge clk)
		secret <= secret + 1'b1;	

assign abonents_secret = secret;

endmodule 
