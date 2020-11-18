module out_vector(clk, write_enable, data1, data2, data3, data4, data_out1, data_out2, data_out3, data_out4);
	
	input logic clk, write_enable;
	input logic [31:0] data1, data2, data3, data4;
	
	output logic [31:0] data_out1, data_out2, data_out3, data_out4;

	logic [31:0]vbank[0:1][0:3]; // 1 reg vectores con 4 elementos de 32 bits
	
	always_ff @(posedge clk)
		if(write_enable) begin
			vbank[0][0] = data1;
			vbank[0][1] = data2;
			vbank[0][2] = data3;
			vbank[0][3] = data4;
		end
		
	assign data_out1 = vbank[0][0];
	assign data_out2 = vbank[0][1];
	assign data_out3 = vbank[0][2];
	assign data_out4 = vbank[0][3];
	
endmodule
