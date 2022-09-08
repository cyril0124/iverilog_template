`timescale 1ns/1ns

module test_tb();


initial begin
    #1000
    $display("\n[%d]simulation done!\n",$time);
    $stop;
end


test u_test
(
    .clk(u_temp.clk)
);

temp u_temp();

//**************************************************************************
//                仿真文件生成
//**************************************************************************
initial
begin
    $dumpfile("test_tb.vcd");  //生成vcd文件，记录仿真信息
    $dumpvars(0, test_tb);     //指定层次数，记录信号，0时刻开始
    #650000
    $stop;
end 

endmodule