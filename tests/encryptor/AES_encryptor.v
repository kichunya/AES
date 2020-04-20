module AES_encryptor #(parameter INITIAL_VEC = 128'h000102030405060708090A0B0C0D0E0F)
(
	input clk,
	input reset,
	 
	input [127:0] datain,
	input dat_stb, //данные на входе можно забрать

	input [127:0] key,
	input key_valid,

	input wire o_stb, //дешифратор говорит что он забиарет
	 
	output wire o_valid, //данные на выходе можно забрать
	output wire [127:0] dataout,
	output reg ready //свободен и готов работать
);
	
	wire [127:0] data_out;
	reg o_valid_reg;

	reg [127:0] data_reg;
	wire [127:0] data;
		  
	reg [127:0] mem_key_reg;
	wire [127:0] mem_key;
		  
	reg [127:0] rin;
	reg [127:0] keylastin;
		  
	wire [127:0] pr_data;
	wire [127:0] pr_key;
		  
	reg [3:0] rc;
	reg module_work;

	reg [127:0] last_cycle_dat;
	
	always @(posedge clk)
	begin
		if (reset)
			last_cycle_dat <= INITIAL_VEC;
		else if(o_valid)
			last_cycle_dat <= dataout;
		else 
			last_cycle_dat <= last_cycle_dat;
	end



	
	always @(posedge clk)
	begin
		if (reset)
			module_work <= 1'b0;
		else if (rc == 4'b1001)
			module_work <= 1'b0;
		else if (dat_stb && key_valid && ready)
			module_work <= 1'b1;
		else
			module_work <= module_work;
	end
		  
	always @(posedge clk)
		if (reset)
			rc <= 4'b0000;
		else if (rc == 4'b1001)
			rc <= 4'b0000;
		else if ((dat_stb && key_valid && ready) || module_work)
			rc <= rc + 4'd1;
		else
			rc <= rc;
		 
    always @(posedge clk)
		if (reset)
			data_reg <= 0;
		else if ((dat_stb && key_valid && ready) || module_work)
			data_reg <= pr_data;
		else 
			data_reg <= data_reg;
							 
	always @(posedge clk)
		if (reset)
			mem_key_reg <= 0;
		else if ((dat_stb && key_valid && ready) || module_work)
			mem_key_reg <= pr_key;
		else
			mem_key_reg <= mem_key_reg;
        
	assign data = (dat_stb && key_valid && ready) ? (datain ^ key ^ last_cycle_dat) : data_reg;
	assign mem_key = (dat_stb && key_valid && ready) ? key : mem_key_reg;
		  
    enrounds round
	(
        .clk(clk), 
        .rc(rc), 
        .data(data), 
        .keyin(mem_key), 
        .keyout(pr_key), 
        .rndout(pr_data)
    );

	enroundlast r10
	(
        .clk(clk),
        .rc(4'b1001),
        .rin(rin),
        .keylastin(keylastin),
        .fout(data_out)
    );
		  
	always @(posedge clk)
		if (reset)
			rin <= 0;
		else if (rc == 4'b1000)
			rin <= pr_data;
		else
			rin <= rin;
							 
	always @(posedge clk)
		if (reset)
			keylastin <= 0;
		else if (rc == 4'b1000)
			keylastin <= pr_key;
		else
			keylastin <= keylastin;

    

	always @(posedge clk)
		if (reset)
			o_valid_reg <= 1'b0;
		else if (o_valid && o_stb)
			o_valid_reg <= 1'b0;
		else if (rc == 4'b1001)
			o_valid_reg <= 1'b1;
		else
			o_valid_reg <= o_valid_reg;

	always @(posedge clk)
		if (reset)
			ready <= 1'b1;
		else if (ready && dat_stb && key_valid)
			ready <= 1'b0;
		else if (o_valid && o_stb)
			ready <= 1'b1;
		else
			ready <= ready;

	assign dataout = data_out;
	assign o_valid = (rc == 4'b1001) ? 1'b1 : o_valid_reg;
    
endmodule
