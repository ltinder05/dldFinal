module lfsr64 (seed, clk, reset, shift_seed);
//inputs and outputs for the full seed size (64 bits)

//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version

input logic [63:0] seed;
input logic clk;
input logic reset;
output logic [63:0] shift_seed;

always @(posedge clk or posedge reset) begin
    if (reset)
        begin
            shift_seed <= seed;
        end 
    else
        begin
            shift_seed <= {shift_seed[62:0], shift_seed[63] ~^ shift_seed[62] ~^ shift_seed[60] ~^ shift_seed[59]};
        end
end


endmodule