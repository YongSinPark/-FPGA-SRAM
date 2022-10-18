`timescale 1ns / 1ps

module tb_Static_ram();
    reg i_clk;
    reg i_rw;
    reg i_ce;
    reg [5:0] i_address;
    wire [7:0] io_data;
    
    reg [7:0] i_data;
    assign io_data = !i_rw ? i_data : 8'hz;

    Static_ram Static_ram(
    .i_clk(i_clk),
    .i_rw(i_rw),
    .i_ce(i_ce),
    .i_address(i_address),
    .io_data(io_data)
    );

    always #5 i_clk = ~i_clk;

    initial begin
        i_clk = 0;
        i_ce = 1;

        i_rw = 0;

        for(integer i = 0; i < 64; i = i + 1)
        begin
            #20 i_address = i+1; i_data = i;
        end

        #20 i_rw = 1;

        for(integer i = 0; i < 64; i = i + 1)
        begin
            #20 i_address = i;
        end

        #20 $finish;
    end

endmodule
