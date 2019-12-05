module LFSR_14(clk, data_out);
	output [14:1] data_out;
	input clk;

	reg [14:1] sreg;
	reg [14:1] tmp;
	initial sreg = 14'd1;
	always @ (posedge clk)
		begin
			tmp = {sreg[6:1], sreg[14] ^ sreg[10] ^ sreg[6] ^ sreg[1]};
			sreg = (tmp > 14'd250 && tmp < 14'd16000) ? tmp : 250 ;
			end
	assign data_out = sreg;
endmodule