`timescale 10ns/1ns
module diffi_helman(
	
	input wire clk,
	input wire key_change,
 	input wire reset,
	input wire [3:0]   secret_key,

	input wire [63:0] partner_key,
	input wire val_p,
	
	output wire [63:0] my_key,
	output wire val_my_key,

	output wire [127:0] K,
	output wire val_K
	
);

reg [3:0] count1;
reg [3:0] count2;
reg [63:0] g;
reg [63:0] p;
reg val_my_key_reg;
reg val_K_reg;
reg [63:0] K_reg;
reg [63:0] K_reg1;
reg [63:0] div2;
reg work;
reg [3:0] secret_key_reg;

assign K = {{64{1'b0}}, K_reg1};
assign val_K = val_K_reg;
assign my_key = g;
assign val_my_key = val_my_key_reg;

always @(posedge clk)
	secret_key_reg <= key_change ? secret_key : secret_key_reg;

always @(posedge clk)
	if (reset) 
		work <= 1'b0;
	else if (key_change)
		work <= 1;
	else if (val_K)
		work <= 1'b0;

always @(posedge clk)
	if (reset)
	  g <= 64'd37;
	else if (~(count1 == secret_key_reg ) & work)
     g <= g * 64'd37;
			
always @(posedge clk)
  if (reset)
    count1 <= 4'b1;
  else if (~(count1 == secret_key_reg) & work)
    count1 <= count1 + 1'b1;
	
always @(posedge clk)
	if (reset)
		p <= 64'b100110001010000000110001;
		
always @(posedge clk)
	if (reset)
		val_my_key_reg <= 1'b0;
	else if ((count1 == secret_key_reg) & work)
		val_my_key_reg <= 1'b1;
	else 
		val_my_key_reg <= 1'b0;
		
always @(posedge clk)
	if (reset)
		count2 <= 4'b0;
	else if (~(count2 == secret_key_reg) & (val_p) & work)
		count2 <= count2 + 1'b1;
			
always @(posedge clk)
	if (reset)
		K_reg <= 64'b1;
	else if (~(count2 == secret_key_reg) & (val_p) & work)
		K_reg <= K_reg * partner_key;
	
always @(posedge clk)
	if (reset)
		val_K_reg <= 1'b0;
	else if ((count2 == secret_key_reg) && (K_reg > p) && (K_reg1 < p) & work)
		val_K_reg <= 1'b1;
	else if ((count2 == secret_key_reg) & work)
		val_K_reg <= 1'b1;
	else 
		val_K_reg <= 1'b0;
		
always @(posedge clk)
   if ((count2 == secret_key_reg) && (K_reg > p) && work)
	   K_reg1 <= K_reg % p;
	else if (count2 == secret_key_reg)
		K_reg1 <= K_reg;
		
endmodule

