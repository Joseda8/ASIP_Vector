module const_mem(clk, addr1, addr2, addr3, addr4, out1, out2, out3, out4);
		
		input logic clk;
		input logic [31:0] addr1, addr2, addr3, addr4;
		
		output logic [31:0] out1, out2, out3, out4;
		
		logic [31:0] RAM[1023:0];
		
		initial begin
			$readmemh("C:/Users/jdmon/OneDrive/Escritorio/TEC/Proyecto2_arqui/ASIP-Vectorial-final_reduced_cpu/const.txt", RAM);
		end
		
		assign out1 = RAM[addr1[31:0]]; 
		assign out2 = RAM[addr2[31:0]]; 
		assign out3 = RAM[addr3[31:0]]; 
		assign out4 = RAM[addr4[31:0]];
	
endmodule	