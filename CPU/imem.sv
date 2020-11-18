module imem(input logic [31:0] a,
				output logic [29:0] rd);

logic [31:0] RAM[1023:0];

initial
$readmemb("C://Users//jdmon//OneDrive//Escritorio//TEC//Proyecto2_arqui//ASIP-Vectorial-final_reduced_cpu//meminstr.txt", RAM);

assign rd = RAM[a[31:2]]; // word aligned

endmodule 
