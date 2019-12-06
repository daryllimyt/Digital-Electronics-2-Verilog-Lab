module reaction_counter(
	clk,
	start_counting,
	end_counting,
	count
);

	input clk, start_counting, end_counting;
	output [15:0] count;
	
	reg [15:0] count;
	reg state;
	parameter not_counting = 1'd0, counting = 1'd1;
	initial state = not_counting;
	initial count = 16'd0;
	
	always @ (posedge clk, posedge start_counting, posedge end_counting)
		case(state)
			counting:
				if (end_counting) state <= not_counting;
				else count <= count + 1;
			not_counting: 
				if (start_counting) begin
					state <= counting;
					count <= 16'b0;
				end
			default: ;
		endcase
endmodule