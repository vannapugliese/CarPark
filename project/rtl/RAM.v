`timescale 1ns / 100ps





module RAM #(parameter WIDTH = 8, parameter DEPTH = 8)(

	input wire clk,
	
	input wire WE,                  //write enable

	input wire [DEPTH-1:0] Address,  //indirizzo
	
	input wire [WIDTH-1:0] Datain,	//Data in
	
	output wire [WIDTH-1:0] Dataout


	);
	
	


reg [DEPTH-1:0] ram [0:WIDTH-1];  // matrix ram

reg [DEPTH-1:0] read_a // lettura address 
	
	


always @(posedge clk) begin
	if (WE) 
		ram[Address] <= Datain;
		
		read_a <= address;
		
	
		

end // always



assign Dataout = ram[read_a];


	
	
endmodule