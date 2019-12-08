module processor(
	y,
	x,
	clk,
	data_valid,
	switch_in
);

	input [9:0] x;
	input clk, data_valid;
	output [9:0] y;
	input [12:0] switch_in;
	
	wire [8:0] port_out;
	echoram(
		.q (port_out),
		.data (y[9:1]),
		.rdaddress (count),
		.wraddress (count + switch_in),
		.rden (pulse),
		.wren (pulse),
		.clock (clk)
	);
	
	wire pulse;
	
	pulse_gen
	(
		.pulse (pulse),
		.in (data_valid),
		.clk (clk)
	);

	reg [12:0] count;
	initial count = 13'b0;
	
	always @ (negedge data_valid)
			count = count + 1;

			
//	assign y = x - {port_out[8], port_out[8], (port_out >> 1)};
	assign y = x - {port_out[8], port_out[8:0]};

endmodule