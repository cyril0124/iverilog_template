`timescale 1ns/1ns

module test_tb();


initial begin
    #1000
    $display("\n[%d]simulation done!\n",$time);
    $stop;
end

stimulus_signal ss();

sync
#(
    .DLY_NUM(-1),
    .INIT_VAL(0)
)
u_sync
(
    .clk(ss.clk),
    .rst_n(ss.rst_n),
    .input_signal(ss.a),
    .output_signal()
);

sync
#(
    .DLY_NUM(1),
    .INIT_VAL(1)
)
u_sync_2
(
    .clk(ss.clk),
    .rst_n(ss.rst_n),
    .input_signal(!ss.a),
    .output_signal()
);

sync
#(
    .DLY_NUM(2),
    .INIT_VAL(0)
)
u_sync_3
(
    .clk(ss.clk),
    .rst_n(ss.rst_n),
    .input_signal(ss.a),
    .output_signal()
);

filter#(
    .FILTER_LEN   ( 2 )
)u_filter(
    .clk           ( ss.clk    ),
    .rst_n         ( ss.rst_n  ),
    .input_signal  ( ss.b      ),
    .output_signal (   )
);

filter#(
    .FILTER_LEN   ( 5 ),
    .INIT_VAL     ( 1'b0 )
)u_filter_1(
    .clk           ( ss.clk    ),
    .rst_n         ( ss.rst_n  ),
    .input_signal  ( ss.b      ),
    .output_signal (   )
);

edge_detect#(
    .POS_ENABLE   ( 1 ),
    .NEG_ENABLE   ( 1 ),
    .INIT_VAL     ( 1'b0 )
)u_edge_detect(
    .clk          ( ss.clk       ),
    .rst_n        ( ss.rst_n     ),
    .input_signal ( ss.c         ),
    .pos          (   ),
    .neg          (   )
);


test u_test
(
    .clk(ss.clk),
    .rst_n(ss.rst_n)
);


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