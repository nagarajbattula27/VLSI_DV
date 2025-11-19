module ram_16X8_tb();
reg clk,reset;
reg[3:0]wr_enable,rd_enable;
reg[7:0]din;
wire[7:0]dout;

ram_16X8 dut(.clk(clk),.reset(reset),.wr_enable(wr_enable),.rd_enable(rd_enable),.din(din),.dout(dout));

initial begin
clk=0;
forever #5 clk=~clk;
end

task rst();begin
@(negedge clk)
reset=1'b0;
@(negedge clk)
reset=1'b1;
end
endtask

end
endtask

task wr_enb(input[3:0]a);begin
@(negedge clk)
wr_enable=a;
end
endtask

task rd_enb(input[3:0]b);begin
@(negedge clk)
rd_enable=b;
end
endtask

task inp(input[7:0]d);begin
@(negedge clk)
din=d;
end
endtask


integer i;

initial begin

rst();

for(i=1;i<=15;i=i+1)begin
inp(i);
wr_enb(i);
rd_enb(i-1);
end
end

initial begin

$monitor("reset=%0b,clk=%0d,wr_enable=%0b,rd_enable=%0b,din=%0b,dout(dout)",reset,clk,wr_enable,rd_enable,din,dout);

end
endmodule


