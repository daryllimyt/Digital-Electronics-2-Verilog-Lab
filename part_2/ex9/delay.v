//module delay(
//	N,
//	clk,
//	trigger,
//	time_out
//);
//
//// an advancement of tick5000 which allows for a variable length delay (specified by N)
//	input clk, trigger;
//	input [5:0] N;
//	output time_out;
//
//	reg [5:0] N;
//	reg [15:0] count;
//	reg pulse;
//	initial pulse = 1'b0;
//
//	always @ (posedge clock)
//		if (count == 0) begin
//			pulse <= 1'b1;
//			count <= N+1;
//			end
//		else begin
//			pulse <= 1'b0;
//			count <= count - 1;
//			end
//endmodule


// module in lecture
module delay(
	N,
	clk,
	trigger,
	time_out
);

	parameter BIT_SZ = 14;
	
	input clk, trigger;
	input [BIT_SZ-1:0] N;
	output time_out;
	
	reg [BIT_SZ-1:0] count;
	reg time_out;
	
	reg [1:0] state;
	parameter IDLE = 2'b00, COUNTING = 2'b01;
	parameter TIME_OUT = 2'b10, WAIT_LOW = 2'b11;
	
	initial state = IDLE;
	initial count = N - 1'b1;
	
	always @ (posedge clk)
		case (state)
			IDLE: if (trigger == 1'b1) state <= COUNTING;
			COUNTING: if (count==0) begin
							count <= N - 1'b1;
							state <= TIME_OUT;
							end
						 else count <= count - 1'b1;
			TIME_OUT: if (trigger == 1'b0) state <= IDLE;
						 else state <= WAIT_LOW;
			WAIT_LOW: if (trigger == 1'b0) state <= IDLE;
			default : ; // do nothing
		endcase
		
	always @ (*)
		case (state)
			IDLE:			time_out = 1'b0;                          
			COUNTING:	time_out = 1'b0;
			TIME_OUT: 	time_out = 1'b1;
			WAIT_LOW:	time_out = 1'b0;
			default: ;
		endcase
endmodule
		
