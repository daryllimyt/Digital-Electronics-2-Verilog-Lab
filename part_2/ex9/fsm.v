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

	reg en_lfsr;
	reg start_delay;
	reg [9:0] ledr;

	reg running;
	
	initial en_lfsr = 1'b1;
	initial start_delay = 1'b0;
	initial counter = 10'b1;
	initial ledr = 10'b0;
	initial running = 1'b0;
//	always @ (posedge ~trigger)
//		begin
//
//		end
		
	always @ (posedge tick)
		if (running) begin
			if (ledr < 10'd1023) begin
				ledr = ledr + counter;
				counter = counter << 1;
			end
			else begin
				start_delay = 1'b1;
			end
		end
		else begin	
			ledr <= 10'b0;
			counter <= 10'b1;
			start_delay <= 1'b0;
		end
		
	always @ (posedge clk)
		if (~trigger) begin
			running <= 1'b1;
			en_lfsr <= 1'b0;
		end
		else if (time_out) begin
			running <= 1'b0;
			en_lfsr <= 1'b1;
		end
		
endmodule