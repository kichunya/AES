//`timescale 1ns / 1ps
/*`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/KeyGeneration.v"
//`include "D:/verilog/projects/AES_cryptography/decryptor/MakeKey.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey1.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey2.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey3.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey4.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey5.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey6.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey7.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey8.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey9.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/MakeKey10.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/InvMixCol.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/InvSbox.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/InvShiftRows.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/InvSubBytes.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/InvRound.v"
`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/InvLastRound.v"*/

//Algorithm
//first of all AddRoundKey

//Round consists:
//InvShiftRows
//InvSubBytes
//AddRoundKey  
//InvMixColumns

//Last round doesn't have InvMixColumns

module AES_decryptor #(parameter INITIAL_VEC = 128'h000102030405060708090A0B0C0D0E0F)
(
    input clk,
	input reset,
		  
    input wire [127:0] datain,
	input wire dat_stb,
	
    input wire [127:0] key,
	input wire key_valid,

	input wire o_stb,

    output wire [127:0] dataout,
	output wire o_valid,
	output reg ready
);

	reg [127:0] data;
	wire [127:0] data_in;
	reg [127:0] data_out;
	reg [127:0] mem_key;
	reg ovalid;
		  
	wire [127:0] pr_data;
    
    wire [127:0] keys [0:9];
		  
	reg [3:0] rc;
	reg module_work;

	reg [127:0] last_cycle_dat;

	always @(posedge clk)
	begin
		if (reset)
			last_cycle_dat <= INITIAL_VEC;
		else if (o_valid)
			last_cycle_dat <= datain;
		else 
			last_cycle_dat <= last_cycle_dat;
	end

		   
	always @(posedge clk)
		if (reset)
			module_work <= 1'b0;
		else if (rc == 4'b1000)
			module_work <= 1'b0;
		else if (dat_stb && key_valid && ready)
			module_work <= 1'b1;
		else
			module_work <= module_work;
		  
	always @(posedge clk)
		if (reset)
		        rc <= 4'b0000;
		else if ((dat_stb && key_valid && ready) || (rc == 4'b1000))
		        rc <= 4'b0000;
		else if (module_work)
		        rc <= rc + 4'd1;
		else
		        rc <= rc;
								 
	always @(posedge clk)
		if (reset)
			data <= 0;
		else if (dat_stb && key_valid && ready)
			data <= data_in;
		else if (module_work)
			data <= pr_data;
		else data <= data;
							 
	always @(posedge clk)
		if (reset)
			mem_key <= 0;
		else if (dat_stb && key_valid && ready)
			mem_key <= key;
		else
			mem_key <= mem_key;
	 
        //assign r0_out = datain ^ key_0;

        InvLastRound r10(
                .clk(clk),
                .rc(4'b1001),
                .data(datain),
                .keylastin(keys[0]),
                .sb(data_in)
        );

        InvRound r1(
                .clk(clk), 
                .rc(rc), 
                .data(data), 
                .keyin(keys[rc+1]), 
                .sb(pr_data)
        );
		  
	always @(posedge clk)
		if (reset) 
			data_out <= 128'd0;
		else if (rc == 4'b1000)
			data_out <= mem_key ^ pr_data ^ last_cycle_dat;
		else
			data_out <= data_out;
								
	assign dataout = (rc == 4'b1000) ? (mem_key ^ pr_data ^ last_cycle_dat) : data_out;
								
	always @(posedge clk)
		if (reset) 
			ovalid <= 1'b0;
		else if (o_valid && o_stb)
			ovalid <= 1'b0;
		else if (rc == 4'b1000)
			ovalid <= 1'b1;
		else 
			ovalid <= ovalid; 

	always @(posedge clk)
		if (reset)
			ready <= 1'b1;
		else if (ready && dat_stb && key_valid)
			ready <= 1'b0;
		else if (o_valid && o_stb)
			ready <= 1'b1;
		else
			ready <= ready;
								
	assign o_valid = (rc == 4'b1000) ? 1'b1 : ovalid;
		  
	Make_Inv_Key get_k(
        	.key_in(key),
                .key_out(keys[0])
        );

        Make_Inv_Key_2 k2(
                .key_in(mem_key),
                .key_out(keys[1])
        );

        Make_Inv_Key_3 k3(
                .key_in(mem_key),
                .key_out(keys[2])
        );

        Make_Inv_Key_4 k4(
                .key_in(mem_key),
                .key_out(keys[3])
        );

        Make_Inv_Key_5 k5(
                .key_in(mem_key),
                .key_out(keys[4])
        );

        Make_Inv_Key_6 k6(
                .key_in(mem_key),
                .key_out(keys[5])
        );

        Make_Inv_Key_7 k7(
                .key_in(mem_key),
                .key_out(keys[6])
        );

        Make_Inv_Key_8 k8(
                .key_in(mem_key),
                .key_out(keys[7])
        );

        Make_Inv_Key_9 k9(
                .key_in(mem_key),
                .key_out(keys[8])
        );

        Make_Inv_Key_10 k10(
                .key_in(mem_key),
                .key_out(keys[9])
        );
    
endmodule
