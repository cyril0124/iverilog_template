module test
(
    input clk
);
    reg [7:0] data;
    initial begin
        #0
        data = 8'h00;
    end
    always @(posedge clk) begin
        data <= #1 data + 1'b1;
    end

endmodule
