`timescale 1ns / 100ps


module GlobalTime (

input wire clk;

output integer T;

);





	T = 0; //inizializzo il tempo globale al valore intero 0
	
	
	
	always @(posedge clk) begin

	T = T + 1 ;


		

	end     //always 






endmodule