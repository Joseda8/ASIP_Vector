module vector_mux(vin11, vin12, vin13, vin14, vin21, vin22, vin23, vin24, control,
						vout1, vout2, vout3, vout4);
						
	input logic [31:0] vin11, vin12, vin13, vin14, vin21, vin22, vin23, vin24;
	input logic control;
	
	output logic [31:0] vout1, vout2, vout3, vout4;
						
	always_comb begin
		if(control) begin
			vout1 <= vin21;
			vout2 <= vin22;
			vout3 <= vin23;
			vout4 <= vin24;
		end
		
		else begin
			vout1 <= vin11;
			vout2 <= vin12;
			vout3 <= vin13;
			vout4 <= vin14;		
		end
	
	end


endmodule
