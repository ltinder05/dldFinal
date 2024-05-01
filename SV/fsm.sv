module FSM (clk, reset, start, lfsr, state);

   input logic clk;
   input logic reset;
   input logic start;
   input logic lfsr;

   
   output logic [1:0] state;


   typedef enum logic [1:0] {S0, S1, S2} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
          out <= 2'b11;
          if (start) nextstate <= S1;
          else if (lfsr) nextstate <= S2;
          else nextstate <=S0;
      end
       S1: begin
          out <= 2'b01;
          if (!start && lfsr) nexstate <= S2;
          else if (!start && !lfsr) nexstate <= S0;  
          else nextstate <= S1;
       end
       S2: begin
          out <= 2'b10;
          if (start) nexstate <= S1;
          else if (!start && !lfsr) nexstate <= S0;  
          else nextstate <= S2;
       end
       default: begin
          state <= 1'b0;
          cstate <= 1'b0; 	  

      	  nextstate <= S0;
       end
     endcase
endmodule