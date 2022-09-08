`timescale 1ns/1ns

module stimulus_signal ( );

reg  clk;
reg  rst_n;

reg a;
reg b;
reg c;

parameter CLK_FREQ = 20;

initial begin
    #0 clk = 1'b0;
    forever #(CLK_FREQ/2) clk = ~clk;
end

initial begin
    #0 rst_n = 1'b1;
    repeat(4) @(posedge clk); #5
    rst_n = 1'b0;
    repeat(4) @(posedge clk);
    rst_n = 1'b1;
end

initial begin
    #0 a = 1'b0;
    repeat(10) @(posedge clk); #18
    a = 1'b1;
    @(posedge clk); #1
    a = 1'b0;
end

initial begin
    #0 b = 1'b0;
    repeat(10) @(posedge clk); #1
    b = 1'b1;
    repeat(20) @(posedge clk); #1
    b = 1'b0;
end

initial begin
    #0 c = 1'b0;
    repeat(10) @(posedge clk); #1
    c = 1'b1;
    repeat(20) @(posedge clk); #1
    c = 1'b0;
    repeat(10) @(posedge clk); #1
    c = 1'b1;
    repeat(20) @(posedge clk); #1
    c = 1'b0;
end


endmodule