`timescale 1ns / 1ps
`include "D:/verilog/projects/AES_cryptography/decryptor/InvShiftRows.v"


module  testISR();



	reg [127:0] d_in;
	wire [127:0] d_out;


	initial
	begin
		d_in = 128'h d4bf5d30e0b452aeb84111f11e2798e5;

	end

    

    InvShiftRow ISR(
        .sb(d_in),
        .sr(d_out)
    );




endmodule





