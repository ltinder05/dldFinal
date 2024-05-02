// testbench to prove maximal LFSR
module gol_tb ();

input logic [63:0] seed;
input logic clk;
input logic reset;
input logic [1:0] state;
input logic start;
input logic lfsr;
input logic [63:0] grid_evolve;

integer 	 handle3;
integer 	 desc3;

GOL dut (seed, clk, reset, start, lfsr, grid_out);

endmodule // tb
