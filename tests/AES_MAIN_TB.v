`timescale 1ns/1ps
`include "aes_main.v"
`include "clk16.v"

module AES_MAIN_TB();


	reg clk_base;
	wire clk;
	reg rst1;
	reg rst2;

	reg data_in_stb;
	reg data_out_stb;

	reg [127:0] data_in;
	reg [7:0] password;

	wire usr_long_key_valid;
	wire usr_long_key_change_rq;
	reg usr_long_key_ch;
	
	wire ready;
	wire ready_for_transmit;
	wire [127:0] data_out;
	wire data_valid;

	reg [7:0] data_count;
	reg flag;
	integer r, f;


initial
begin
	f = $fopen("D:/verilog/projects/proj/AES_main/file.txt", "r");
        if(~f) 
	begin
        $display("Could not open file");
    end
	flag = 1'b0;
	clk_base  = 0;
	

	rst2 = 0;
	rst1  = 0;
	#32
	rst2 = 1;
    #32
    rst2 = 0;
	#960
	rst1  = 1;
	#960
	rst1  = 0;
	
end

always @(posedge clk)
begin
	if(rst1)
		data_count <= 0;
	else if (ready & data_count < 5)
		data_count <= data_count + 1;
	else 
		data_count <= data_count;
end

always @(posedge clk)
begin
	if(rst1)
		data_in_stb <= 0;
	else if (data_in_stb && ready)
		data_in_stb <= 1'b0;
	else if(ready & data_count < 4)
		data_in_stb <= 1;
end

always @(posedge clk)
begin
	if(rst1)
		data_out_stb <= 0;
	else if(data_valid)
		data_out_stb <= 1;
end

always @(posedge clk)
	if (rst1)
		flag <= 1'b1;

always @(posedge clk)
begin
	if(rst1 & ~flag)
		r <= $fscanf(f, "%h", data_in);
	
	else if(ready & data_in_stb & data_count < 4)
		r <= $fscanf(f, "%h", data_in);
end

always @(posedge clk)
begin
	if(rst1)
		password <= 8'b10101010;
end

always @(posedge clk)
begin
	if(rst1)
		usr_long_key_ch <= 0;
	else if (usr_long_key_ch)
		usr_long_key_ch <= 1'b0;
	else if(usr_long_key_change_rq)
		usr_long_key_ch <= 1;

end



aes_main main(
	.clk_in(clk_base),
	.reset(rst1),
	.reset_clk(rst2),

	//data_in
	.data_in_stb(data_in_stb), //val input data
	.data_out_stb(data_out_stb), //val of outpat taken
	.data_in(data_in),
	.password(password),

	.usr_long_key_valid(usr_long_key_valid), 
	.usr_long_key_change_rq(usr_long_key_change_rq),
	.usr_long_key_ch(usr_long_key_ch), //accept
	
	.ready(ready), //ready  take data
	.ready_for_transmit(ready_for_transmit), //not busy can give transmit_req

	//data_out
	.data_out(data_out),
	.data_valid(data_valid)
);

always 
begin
	#1
    clk_base <= ~clk_base;
end

clk16 clk161
(
	.reset(rst2),
	.clk50(clk_base),
	.clk16(clk)
);


	



endmodule




