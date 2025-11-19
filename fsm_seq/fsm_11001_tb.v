module fsm_11001_tb();
reg d,clk,reset;
wire out;
fsm_11001 dut(.d(d),.clk(clk),.reset(reset),.out(out));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1'b0;
#5;reset=1'b1;
#5;d=1'b0;
#10;d=1'b1;
#10;d=1'b1;
#10;d=1'b0;
#10;d=1'b0;
#10;d=1'b1;
#10;d=1'b1;
end
endmodule

