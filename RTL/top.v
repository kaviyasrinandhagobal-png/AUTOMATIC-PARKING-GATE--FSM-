`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: top
// Wires board switches/buttons to the parking_gate FSM and shows
// its output + a 1Hz heartbeat on the LEDs.
//////////////////////////////////////////////////////////////////////////////////

module top(
    input        mclk,
    input  [2:0] sw,     // sw[0]=entry, sw[1]=full, sw[2]=pass
    input        btn0,   // reset
    output [3:0] led     // led[0] = open, led[3] = 1 Hz tick
);

    wire clk_1hz;
    wire open_sig;

    clk_div #(.HALF(50_000_000)) u_div (
        .clk_in (mclk),
        .rst    (btn0),
        .clk_out(clk_1hz)
    );
 
    parking_gate u_gate (
        .open  (open_sig),
        .entry (sw[0]),
        .full  (sw[1]),
        .pass  (sw[2]),
        .clk   (clk_1hz),
        .rst   (btn0)
    );

    assign led[2:0] = sw;        // inputs shown directly on LEDs
    assign led[3]   = open_sig;
   
endmodule
