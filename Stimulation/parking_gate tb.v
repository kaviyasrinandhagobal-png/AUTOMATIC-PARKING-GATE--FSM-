`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 16:02:44
// Design Name: 
// Module Name: parking_gate tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module parking_gatetb;
reg clk,rst,entry,pass,full;
wire open;
integer i;
parking_gate uut (.clk(clk),.rst(rst),.entry(entry),.pass(pass),.full(full),.open(open));
initial 
begin
clk=0;
forever #10 clk=~clk;
end
initial
begin
rst=1;
@(posedge clk)
@(posedge clk)
rst=0;
end
initial
begin
entry=0;
pass=0;
full=0;
end
initial  
begin 
for(i=0;i<10;i=i+1)
begin
@(posedge clk);
entry=$random; 
pass=$random;
full=$random;
#10;
$display("%b %b %b %b %b",entry,pass,full,open,uut.ns);
end
$finish;
end  
endmodule
