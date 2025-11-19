module d_ff(clk,reset,d,q);
input clk,reset,d;
output reg q;
always@(posedge clk)begin

if(reset)
q<=0;
else
q<=d;
end
endmodule

module siso(d,qout,clk,reset);
input d;
input clk,reset;
output qout;
wire[3:0]q;

d_ff d0(.d(d),.clk(clk),.reset(reset),.q(q[0]));
d_ff d1(.d(q[0]),.clk(clk),.reset(reset),.q(q[1]));
d_ff d2(.d(q[1]),.clk(clk),.reset(reset),.q(q[2]));
d_ff d3(.d(q[2]),.clk(clk),.reset(reset),.q(qout));

endmodule
