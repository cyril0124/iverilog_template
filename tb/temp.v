module temp ( );

reg  clk;

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

endmodule