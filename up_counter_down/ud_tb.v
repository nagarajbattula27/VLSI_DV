module ud_tb();
reg clk,reset,up_down;
wire[4:0]count;
up_down dut(.clk(clk),.reset(reset),.up_down(up_down),.count(count));

initial begin
clk=0;
forever #5 clk=~clk;
end

task rst();begin
@(negedge clk)
reset=1'b1;
@(negedge clk)
reset=1'b0;
end
endtask

task ud(input a);begin
@(negedge clk)
up_down=a;
end
endtask

initial begin
#5;rst();
#10;ud(1);
#15;rst();
#20;ud(0);
end
initial 
$monitor("clk=%0b,reset=%0b,up_down=%0b,count=%0b",clk,reset,up_down,count);
endmodule
