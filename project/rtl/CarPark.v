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



`timescale 1ms / 100us           

module CarPark (  

   input  wire Sin , Sout, Pay ,    // sensors and payment
   
   
   
   output wire Bin , Bout,          //bars
   
  // output reg P,                    //free parking places  (integer??)
   
   //output reg [(PMax-3'd1):0] t    //entry time
   
   output wire Cost,                      //DA MODIFICARE
   
   input wire clk , rst
   
  
   ) ;


	// state definition

	parameter FreePark = 3'b000, Waiting4Enter = 3'b001, Entry = 3'b010, Busy = 3'b011 , Waiting4Exit = 3'b100 , Exit = 3'b101 ;
	
	reg[2:0] State, NextState;
	
    //Maximun number of parcking places
	
	parameter integer PMax=5;
	
	//free parking places 
	
	integer P;
	
	//car codes
	
	wire [3:0] code;                 //DA RIVEDERE
	
	
	
	//global time
	
	integer T=0;          //inizialized value for global time
	integer [PMax-1:0] t;    //entry time     
	
	
	//Next state logic
	
always @(posedge clk ) begin

		
      if(rst)
         State <= FreePark ;

      else
         State <= NextState ;


	end // always 
	

//global time counter	

always @(posedge clk) begin          

	T = T + 1 ;

	end     //always 
	

//Combination part

always @(*) begin //always 

    Bin=1'b0;
	Bout=1'b0;
	//T = 0;                           //inizialization
	P=PMax;
	[3:0] code = 4'b0000;
	
	Cost=0;                      //DA RIVEDERE
	
	case (State)
	   
	      default : NextState <= FreePark ;      // catch-all
		  
		  FreePark : begin
		  
		   Bin=1'b0;
	       Bout=1'b0;
		   T = 0;                        //start
		   
		   //Sout=1'b0;
	
	       P=PMax;
	
	       Cost=0;                      //DA RIVEDERE
		   
		   if(Sin == 1'b1)
			    NextState <= Waiting4Enter;
				
			 else
			   NextState <= FreePark ;
		  
		  end
		  
		  Waiting4Enter : begin
		  
		   if(P == 0)
			    NextState <= Waiting4Enter;
				
			 else
			   NextState <= Entry ;
		  
		  end
		  
		  Entry : begin
		  
		  P=P-1;
		  Bin=1'b1;
		  t[P]= T;
		  Codes #(.P(P)) Codes_inst(.code(code))      //assign a code in entry
		  #5000 Bin=1'b0; 
		  NextState <= Busy;
		  
		  //SAVE ENTRY TIME
		  
		  end
		  
		  Busy : begin
		  
		   if(Sout == 1'b1)
			    NextState <= Waiting4Exit;
				
		   else if (Sin == 1'b1 && Sout==1'b0)
                NextState <= Waiting4Enter;			
				
			 else
			   NextState <= Busy ;
		  
		  end
		  
		  Waiting4Exit : begin
		  
		  //WHICH CAR?? IDENTIFICATION
		  
		  integer i;
		  
		  integer tin;
		  
		  for (i = PMax-1; i > -1 ; i = i - 1) begin
		  
		    if (tin==t[i])
			
			;
			
			else
			;
		  
		  end    // for
		  
		  //CALCULATE AND SHOW PRICE
		  if(T-t[i]<3600)
		  Cost=4'd1;
		  else if (3600<T-t[i] && (T-t[i]<7200)
		  Cost = 4'd2;
		  else if (7200<T-t[i] && (T-t[i]<10800)
		  Cost = 4'd3;
		  else if (10800<T-t[i] && (T-t[i]<14400)
		  Cost = 4'd4;
		  else if (14400<T-t[i])
		  Cost = 4'd5;
		  
		  
		   if(Pay == 1'b1)
			    NextState <= Exit;
				
			 else
			   NextState <= Waiting4Exit ;
		  
		  end
		  
		  Exit : begin
		  
		  P=P+1;
		  Bout=1'b1;
		  #5000 Bout=1'b0;
		  
		   if(P == PMax)
			    NextState <= FreePark;
				
			 else
			   NextState <= Busy ;
		  
		  end

         endcase  //case


	end //always






	







 

endmodule

