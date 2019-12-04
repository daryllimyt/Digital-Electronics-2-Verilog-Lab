module delay(
	N,
	clk,
	trigger,
	time_out
);

// an advancement of tick5000 which allows for a variable length delay (specified by N)
	input clk, trigger;
	input [5:0] N;
	output time_out;

	reg [5:0] N;
	reg [15:0] count;
	reg pulse;
	initial pulse = 1'b0;

	always @ (posedge clock)
		if (count == 0) begin
			pulse <= 1'b1;
			count <= N+1;
			end
		else begin
			pulse <= 1'b0;
			count <= count - 1;
			end
endmodule