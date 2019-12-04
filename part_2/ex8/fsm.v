module fsm(
	clk,
	tick,
	trigger,
	time_out,
	en_lfsr,
	start_delay,
	ledr
);

	input clk;
	input tick;
	input trigger;
	input time_out;

	output en_lfsr;
	output start_delay;
	output [9:0] ledr;

	reg [9:0] counter; // A one hot counter

	initial en_lfsr = 1'b1;
	initial start_delay = 1'b0;
	initial counter = 10'b1;
	initial ledr = 10'b0;

	always @ (posedge clk)
		if ledr <> 1023 begin
			ledr += counter;
			counter = counter << 1;
		else begin
			en_lfsr = 1'b0;
			start_delay = 1'b1;

endmodule
