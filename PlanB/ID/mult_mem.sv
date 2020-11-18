module mult_mem(clk, we, wd1, wd2, wd3, wd4, 
					 out1, out2, out3, out4, out5, out6, out7, out8,
					 flag);

	input logic clk, we;
	input logic [31:0] wd1, wd2, wd3, wd4;
	
	output logic [31:0] out1, out2, out3, out4, out5, out6, out7, out8;
	output int flag;
	
	logic [31:0] MULT_MEM[1023:0];
	
	
	initial begin
		flag = 1;
	end
	
	
	assign out1 = MULT_MEM[32'b0]; 
	assign out2 = MULT_MEM[32'b1]; 
	assign out3 = MULT_MEM[32'b10]; 
	assign out4 = MULT_MEM[32'b11]; 
	assign out5 = MULT_MEM[32'b100]; 
	assign out6 = MULT_MEM[32'b101]; 
	assign out7 = MULT_MEM[32'b110]; 
	assign out8 = MULT_MEM[32'b111]; 
	
	always @(negedge we) begin
		if(flag == 0) 
			flag <= 1;
		else
			flag <= 0; 
	end
	
	always @(posedge clk) begin
		if (we) begin
			if(flag == 0) begin
				MULT_MEM[32'b0] <= wd1;
				MULT_MEM[32'b1] <= wd2;
				MULT_MEM[32'b10] <= wd3;
				MULT_MEM[32'b11] <= wd4;
			end
			
			else if(flag == 1) begin
				MULT_MEM[32'b100] <= wd1;
				MULT_MEM[32'b101] <= wd2;
				MULT_MEM[32'b110] <= wd3;
				MULT_MEM[32'b111] <= wd4;
			end
		end
	end
	
	
endmodule
