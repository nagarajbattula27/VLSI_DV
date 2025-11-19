/*module fsm_11001(d,out,clk,reset);
input d,clk,reset;
output out;
parameter 
 	s0=3'b000,
 	s1=3'b001,
 	s2=3'b010,
 	s3=3'b011,
 	s4=3'b100;
reg[2:0]ps,ns;
always@(posedge clk,posedge reset)begin
if(reset)
ps<=s0;
else
ps<=ns;
end

always@(*)begin
case(ns)
s0:if(d)
	ns=s1;
	else
	ns=s0;
s1:if(d)
	ns=s2;
	else
	ns=s0;
s2:if(d)
	ns=s2;
	else
	ns=s3;
s3:if(d)
	ns=s1;
	else
	ns=s4;
s4:if(d)
	ns=s1;
	else
	ns=s0;
default:ns=s0;
endcase
end
assign out=s4?1:0;
endmodule*/

