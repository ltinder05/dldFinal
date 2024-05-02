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
          state <= 2'b11;
          if (start) nextstate <= S1;
          else if (lfsr) nextstate <= S2;
          else nextstate <=S0;
      end
       S1: begin
          state <= 2'b01;
          if (!start && lfsr) nextstate <= S2;
          else if (!start && !lfsr) nextstate <= S0;  
          else nextstate <= S1;
       end
       S2: begin
          state <= 2'b10;
          if (start) nextstate <= S1;
          else if (!start && !lfsr) nextstate <= S0;  
          else nextstate <= S2;
       end
       endcase
endmodule
