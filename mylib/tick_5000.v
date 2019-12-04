module tick_50000 (
	clock,
	pulse
);

	input clock;
	output pulse;

	reg [15:0] count;
	reg pulse;
	initial pulse = 1'b0;

	always @ (posedge clock)
		if (count == 0) begin
			pulse <= 1'b1;
			count <= 50000;
			end
		else begin
			pulse <= 1'b0;
			count <= count - 1;
			end
endmodule


module tick_5000 (
	clock,
	pulse
);

	input clock;
	output pulse;

	reg [15:0] count;
	reg pulse;
	initial pulse = 1'b0;

	always @ (posedge clock)
		if (count == 0) begin
			pulse <= 1'b1;
			count <= 5000;
			end
		else begin
			pulse <= 1'b0;
			count <= count - 1;
			end
endmodule