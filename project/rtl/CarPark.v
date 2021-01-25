//-----------------------------------------------------------------------------------------------------
//                               University of Torino - Department of Physics
//                                   via Giuria 1 10125, Torino, Italy
//-----------------------------------------------------------------------------------------------------
// [Filename]       SequenceDetector.v [RTL]
// [Project]        Advanced Electronics Laboratory course
// [Author]         Luca Pacher - pacher@to.infn.it
// [Language]       Verilog 2001 [IEEE Std. 1364-2001]
// [Created]        May 25, 2020
// [Modified]       -
// [Description]    Example Moore Finite State Machine (FSM) for 110 sequence detector.
// [Notes]          -
// [Version]        1.0
// [Revisions]      25.05.2020 - Created
//-----------------------------------------------------------------------------------------------------

//
// Dependencies :
//
// n/a
//



`timescale 1ns / 100ps

module Parking (  

   input  wire Sin , Sout, Pay ,   // sensors and payment
   
   output wire Bin , Bout,     //bars
   
   output reg P,              //free parking places
   
   output reg [(PMax-3'd1):0] t    //entry time
   
   input wire clk , rst
   
  
   ) ;


	// state definition


	parameter FreePark = 3'b000, Waiting4Enter = 3'b001, Entry = 3'b010, Busy = 3'b011 , Waiting4Exit = 3'b100 , Exit = 3'b101 ;
	
	reg[2:0] State, NextState;
	
    //Maximun number of parcking places
	
	parameter PMax=3'd5;
	
	//global time
	reg T;
	
	//Next state logic
	
	
always @(posedge clk ) begin

		
      if(rst)
         State <= FreePark ;

      else
         State <= NextState ;



	end // always 



//Combination part




always @(*) begin //always 

    Bin=1'b0;
	Bout=1'b0;
	
	P=PMax;
	
	[(PMax-3'd1):0] t





	end //always






	







 

endmodule

