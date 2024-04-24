// testbench to prove maximal LFSR
module tb64 ();

   //logic variables to route input and output to DUT
   logic [63:0]  seed;
   logic reset;
   logic 	 clk;
   logic [63:0] shift_seed;
   logic [255:0]  cycles;
   logic [63:0] origin;


   //create file handles to write results to a file
   integer 	 handle3;
   integer 	 desc3;

   // instantiate device under test (small LFSR)
   lfsr64 dut (seed, clk, reset, shift_seed);

   //set up a clock signal
   always     
     begin
	    clk = 1; #1; clk = 0; #1;
     end
     
    initial
      begin
      //set up output file
	       desc3 = handle3;
    end
	  //set up any book keeping variables you may want to use
	  //set up a starting seed.  What happens with all 0s
	     //reset your DUT
    initial
     begin
	    #0   reset = 1'b1;	
	    #0   seed = 64'h7A4E2A864EFACDC6;

	    #20  reset = 1'b0;	
      
    end
	     //save the initial output of your DUT to compare with current output

	     //and see whenb you repeat

   always @(posedge clk)
     begin
		//output your results to a file
    $fdisplay(desc3, "%h || %h || %b", 
		 seed, shift_seed, (seed==shift_seed));

     end

   always @(negedge clk) begin
      if (reset)
        cycles = 0;
      else begin
            cycles = cycles + 1; 
            if (cycles == 1) begin
            end
            else begin
              if (shift_seed == seed) begin 
                $fdisplay(desc3, "%h || %h || %b", 
		            seed, shift_seed, (seed==shift_seed));
                $fdisplay(desc3, "\nFound the repeat at cycle = %h\n", cycles);
                $finish;
              end
            end
      end
   end


          

		//check if your output equals the initial output 
		//if so, report how many iterations it took to repeat
		//this should be (2^n) - 1
		//if the output never repeats for 2^n iterations, report that

   
endmodule // tb
