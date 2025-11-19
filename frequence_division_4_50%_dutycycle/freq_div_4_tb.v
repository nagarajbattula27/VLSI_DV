module freq_div_tb();
reg clk,reset;
wire count;

freq_4 dut(.clk(clk),.reset(reset),.count(count));
//freq_4 dut(.clk(clk),.reset(reset),.count(count));

initial begin

clk=0;
forever #5 clk=~clk;

end

task rst();begin
@(negedge clk)
reset<=1'b1;
@(negedge clk)
reset<=1'b0;
end
endtask

initial begin
#5;rst();
#10;rst();
end

endmodule
