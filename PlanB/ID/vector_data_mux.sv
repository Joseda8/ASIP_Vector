module vector_data_mux(vin1, vin2, vin3, vin4, vin5, vin6, vin7, vin8,
							  in1, in2, in3, in4, in5, in6, in7, in8,
							  out1, out2, out3, out4, out5, out6, out7, out8,
							  control);
							  
	input logic control;
	input logic [31:0] vin1, vin2, vin3, vin4, vin5, vin6, vin7, vin8, in1, in2, in3, in4, in5, in6, in7, in8;
	
	output logic [31:0] out1, out2, out3, out4, out5, out6, out7, out8;
	
	always_comb begin
		
		if(control) begin			
			out1 <= in1;
			out2 <= in2;
			out3 <= in3;
			out4 <= in4;
			out5 <= in5;
			out6 <= in6;
			out7 <= in7;
			out8 <= in8;			
		end
		
		else begin
			out1 <= vin1;
			out2 <= vin2;
			out3 <= vin3;
			out4 <= vin4;
			out5 <= vin5;
			out6 <= vin6;
			out7 <= vin7;
			out8 <= vin8;	
		end
	
	end
	

endmodule
