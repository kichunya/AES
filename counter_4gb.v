`timescale 1ns/1ps

module counter_4gb(
	input o_strob,
	input clk,
	input reset,
	output answ
);

reg [2:0] counter0;
reg answ1;

assign answ = answ1;

always @(posedge clk)
	if (reset)
		counter0 <= 1'b1;
	else if (o_strob)
		counter0 <= counter0 + 1'b1;
	else if (counter0 == 0)
		counter0 <= 1'b1;



always @(posedge clk)
	if (reset)
		 answ1 <= 1'b0;
	else if (answ1)
		answ1 <= 1'b0;
	else if ((counter0 == 0) )
		answ1 <= 1'b1;

	

endmodule
