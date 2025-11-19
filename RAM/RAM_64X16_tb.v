module ram_64X16_tb();
reg clk,reset,wr_enable,rd_enable;
reg[15:0]data_in;
reg[5:0]wr_adress,rd_adress;
wire[15:0]data_out;
ram_64X16 dut(.clk(clk),.reset(reset),.wr_enable(wr_enable),.rd_enable(rd_enable),.data_in(data_in),.wr_adress(wr_adress),.rd_adress(rd_adress),.data_out(data_out));
initial begin
clk=0;
forever #5 clk=~clk;
end

task initialize();begin
data_in<=5'b00000;
end
endtask

task rst();begin
@(negedge clk)
reset=1'b1;
@(negedge clk)
reset=1'b0;
end
endtask

task wr_e(input a);begin
@(negedge clk)
wr_enable=a;
end
endtask

task rd_e(input b);begin
@(negedge clk)
rd_enable=b;
end
endtask

task data(input[15:0]c);begin
@(negedge clk)
data_in=c;
end
endtask

task wr_ad(input[5:0]d);begin
@(negedge clk)
wr_adress=d;
end
endtask

task rd_ad(input[5:0]e);begin
@(negedge clk)
rd_adress=e;
end
endtask

integer i;

initial begin
initialize();
rst();
wr_e(1);
rd_e(1);
data(16'b111111110000000);
for(i=0;i<=63;i=i+1)begin
wr_ad(i);
rd_ad(i);
end
end
initial 
$monitor("clk=%0b,reset=%0b,wr_enable=%0b,rd_enable=%0b,wr_adress=%0b,rd_adress=%0b,data_in=%0b,data_out=%0b",clk,reset,wr_enable,rd_enable,wr_adress,rd_adress,data_in,data_out);
endmodule
