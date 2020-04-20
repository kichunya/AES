module clk16 (
	input reset,
	input clk50,
	output reg clk16
);


reg clk2;
reg clk4;
reg clk8;
//reg clk16;





//assign clk3 = clk16;


always@(posedge clk50) 
begin 
	
	clk2 <= reset ? 1'b0 : ~clk2;
end

always@(posedge clk50)
begin 
		clk4 <= reset ? 1'b0 : 
			 ~clk2 ? ~clk4 : clk4;
end

always @(posedge clk50)
	clk8 <= reset ? 1'b0 :
		(~clk2 & ~clk4) ? ~clk8 : clk8;

always@(posedge clk50)
	clk16 <= reset ? 1'b0 :
		(~clk2 & ~clk4 & ~clk8) ? ~clk16 : clk16;

endmodule
