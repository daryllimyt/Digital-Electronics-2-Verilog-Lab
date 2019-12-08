module addresser(
	clock,
	address_in,
	address_out
);
	input clock;
	input address_in;
	output address_out;

	reg address;

	always (posedge clock)
		address_out = address;
		address = address_in + address_out;
endmodule
