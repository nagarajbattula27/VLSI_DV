module fsm(d,out,clk,reset);
input d,clk,reset;
output  out;
parameter s0=3'b000,
	 s1=3'b001,
	 s2=3'b010,
	 s3=3'b011,
	s4=3'b100,
	s5=3'b101;
	
reg[2:0]p_s,n_s;

always@(posedge clk)begin

if(reset)
p_s<=s0;
else

p_s<=n_s;

end

always@(*)begin

case(p_s)

s0:if(d)
	n_s=s1;
	else
	n_s=s0;
s1: if(d)
	n_s=s3;
	else
	n_s=s2;
s2:if(d)
	n_s=s4;
	else
	n_s=s0;
	
s3:if(d)
	n_s=s3;
	else
	n_s=s2;
	
s4:if(d)
	n_s=s5;
	else
	n_s=s2;
	
s5:if(d)
	n_s=s3;
	else
	n_s=s2;
default:n_s=s0;
	
endcase
end

assign out=s5?1'b1:1'b0;
//assign out=s3?1'b1:1'b0;

endmodule


