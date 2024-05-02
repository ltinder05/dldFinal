module GOL (seed, clk, reset, start, lfsr, state, grid_evolve, grid_out);

logic [63:0] y;
logic [63:0] evolved;
logic [63:0] shift_seed;
input logic [63:0] seed;
input logic clk;
input logic reset;
input logic [1:0] state;
input logic start;
input logic lfsr;
input logic [63:0] grid_evolve;

output logic [63:0] grid_out;

lfsr64 dut (seed, clk, state[0], shift_seed);
FSM dut1 (clk, reset, start, lfsr, state);
mux2 dut2 (grid_out, shift_seed, state[1], y);
datapath dut3 (y, evolved);
flop dut4 (clk, evolved, grid_out);

endmodule