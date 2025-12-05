module top(						//top module
	CLK,
	BUT1,
	BUT2,
	LED1,
	LED2
);

input			CLK;				//input 100Mhz clock
input			BUT1;				//input signal from button 1
input			BUT2;				//input signal from button 2
output			LED1;				//output signal to LED1
output			LED2;				//output signal to LED2

reg			BUT1_r=1'b0;				//register to keep button 1 state
reg			BUT2_r=1'b0;				//register to keep button 2 state

reg			LED_state=1'b0;
reg			[14:0] rst_count=0;

assign LED1 = LED_state;
assign LED2 = LED_state;

always @ (posedge CLK) begin			//on each positive edge of 24414Hz clock
	BUT1_r <= BUT1;					//capture button 1 state to BUT1_r
	BUT2_r <= BUT2;					//capture button 2 state to BUT2_r
		
	if(BUT1_r == 1'b0 && BUT2_r == 1'b0) begin
		LED_state <= 1'b1;				//copy inversed state of button 1 to LED1_m0_r
	end else begin
		LED_state <= 1'b0;
	end
end

endmodule
