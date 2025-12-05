module top(
	CLK,
	BUT1,
	BUT2,
	LED1
);

input			CLK;
input			BUT1;
input			BUT2;
output			LED1;

reg			BUT1_r=1'b0;
reg			LED_state=1'b0;

assign LED1 = LED_state;

always @ (posedge CLK) begin
	BUT1_r <= BUT1;
	BUT2_r <= BUT2;
		
	if(BUT1_r == 1'b0 && BUT2_r == 1'b0) begin
		LED_state <= 1'b1;
	end else begin
		LED_state <= 1'b0;
	end
end

endmodule
