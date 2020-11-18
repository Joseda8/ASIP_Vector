module vector_data_mux_tb();

	logic control;
	logic [31:0] vin1, vin2, vin3, vin4, vin5, vin6, vin7, vin8, in1, in2, in3, in4, in5, in6, in7, in8,
					 out1, out2, out3, out4, out5, out6, out7, out8;
	

	vector_data_mux uut(vin1, vin2, vin3, vin4, vin5, vin6, vin7, vin8,
							  in1, in2, in3, in4, in5, in6, in7, in8,
							  out1, out2, out3, out4, out5, out6, out7, out8,
							  control);
							  
							  
	initial begin
	
		#10 vin1 = 32'd1; vin2 = 32'd2; vin3 = 32'd3; vin4 = 32'd4; vin5 = 32'd5; vin6 = 32'd6; vin7 = 32'd7; vin8 = 32'd8;
			 in1 = 32'd9; in2 = 32'd10; in3 = 32'd11; in4 = 32'd12; in5 = 32'd13; in6 = 32'd14; in7 = 32'd15; in8 = 32'd16;
			 control = 0;
			 
		#20;
		
		#10 control = 1;
		
		#50;
	
	end
							  

endmodule
