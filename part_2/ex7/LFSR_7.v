module LFSR_7(clk, data_out);
	output [7:1] data_out;
	input clk;

	reg [7:1] sreg;
	initial sreg = 7'd1;
	always @ (posedge clk)
		begin
			sreg <= {sreg[6:1], sreg[7] ^ sreg[1]};
			end
		
	assign data_out = sreg;
endmodule