module sum_mem(clk, we, addr1, addr2, addr3, addr4, 
					wd1, wd2, wd3, wd4, 
					sumr1, sumr2, sumr3, sumr4);
					
	input logic clk, we;
	input logic [31:0] addr1, addr2, addr3, addr4, wd1, wd2, wd3, wd4;
	
	output logic [31:0] sumr1, sumr2, sumr3, sumr4;
	
	logic [31:0] SUM_RAM[1023:0];
	
	assign sumr1 = SUM_RAM[addr1[31:0]]; 
	assign sumr2 = SUM_RAM[addr2[31:0]]; 
	assign sumr3 = SUM_RAM[addr3[31:0]]; 
	assign sumr4 = SUM_RAM[addr4[31:0]]; 
	
	always @(posedge clk) begin
		if (we) begin
			SUM_RAM[addr1[31:0]] <= wd1;
			SUM_RAM[addr2[31:0]] <= wd2;
			SUM_RAM[addr3[31:0]] <= wd3;
			SUM_RAM[addr4[31:0]] <= wd4;
			/*if (counter === 102401) begin
				$writememh("C://Users//gosae//Documents//FPGA//ARQUI 1//PROY2//Pipeline//outHex.txt", OUT);
			end*/
		end
	end
					
endmodule
