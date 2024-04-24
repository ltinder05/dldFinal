module lfsr(seed, clk, reset, shift_seed);
//inputs and outputs for a smaller implementation
//perhaps 8 or 16 bits

//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register
input logic [7:0] seed;
input logic clk;
input logic reset;
output logic [7:0] shift_seed;

always @(posedge clk or posedge reset) begin
    if (reset)
        begin
            shift_seed <= seed;
        end 
    else
        begin
            shift_seed <= {shift_seed[6:0], shift_seed[7] ~^ shift_seed[5] ~^ shift_seed[4] ~^ shift_seed[3]};
        end
end


endmodule

