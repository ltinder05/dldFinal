module GOL (seed, evolved, clk, reset, y, state, start, lfsr, grid_evolve, grid_out)

input logic [63:0] seed;
logic [63:0] y;
logic [63:0] evolved;
logic [63:0] shift_seed;
input logic clk;
input logic reset;
input logic [1:0] state;
input logic start;
input logic lfsr;
input logic [63:0] grid_evolve;

output logic [63:0] grid_out;

lfsr64 dut (seed, clk, state[0], shift_seed);
fsm dut (clk, reset, start, lfsr, state);
mux2 dut (grid_out, shift_seed, state[1], y);
datapath dut (y, evolved);
flop dut (clk, grid_evolve, grid_out);

endmodule