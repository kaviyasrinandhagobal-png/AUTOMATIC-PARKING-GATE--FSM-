`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 12:10:03
// Design Name: 
// Module Name: parking_gate
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


module parking_gate(open,entry,full,pass,clk,rst);
input clk,rst,entry,full,pass;
output reg open;

 localparam 
S0 = 2'b00, 
S1 = 2'b01,
S2 = 2'b10,
S3 = 2'b11;   
reg [1:0] s,ns;

 always @(posedge clk or posedge rst)
 begin
 if (rst)
   s <= S0;
 else
   s <= ns;
 end
always @(*) 
begin
 ns = s;
if (s == S0) 
begin
  if (entry == 1'b0)
 begin
    ns = S1;
 end

 else if (full == 1'b0)
 begin
    ns = S2;
  end
  else 
begin
    ns = S0;
 end
end
 
else if (s == S1) 
begin
 if (pass == 1'b0) 
begin
     ns = S1;
   end
  else
 begin
     ns = S3;
 end
  end

 else if (s == S2)
 begin
  if (pass == 1'b0)
 begin
      ns = S2;
 end
  else 
begin
     ns = S3;
 end
end

 else if (s == S3) 
begin
    ns = S0;
 end

 else 
begin
    ns = S0;
end

end

 always @(*)
 begin
 if (s == S0)
     open = 1'b0;
else if (s == S1)
    open = 1'b1;
 else if (s == S2)
    open = 1'b1;
else if (s == S3)
    open = 1'b0;
else
   open = 1'b0;
end
endmodule

