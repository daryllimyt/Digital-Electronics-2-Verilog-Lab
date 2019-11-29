`timescale 1ns / 100ps // unit time is 1ns, resolution 100ps

module counter_10 (
	clock,
	enable,
	count,
	reset
);

	// Declaring Ports
	parameter BIT_SZ = 10;
	input clock;
	input enable;
	input reset;
	output [BIT_SZ-1:0] count;
	
	// count must be reg
	reg [BIT_SZ-1:0] count;
	
	// initialise stored element (count) as zero
	initial count = 0;
	
	always @ (posedge clock)
		if (enable == 1'b1)
			if (!reset)
				count <= 0;
			else
				count <= count + 1'b1;

			
endmodule