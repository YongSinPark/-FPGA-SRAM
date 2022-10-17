`timescale 1ns / 1ps

module tb_sram();
    reg i_clk = 0;
    reg i_ce;
    reg i_we;
    reg [5:0] i_address;
    reg [7:0] i_data;
    wire [7:0] o_data;

    Single_ram dut(
    .i_clk(i_clk),
    .i_ce(i_ce),
    .i_we(i_we),
    .i_address(i_address),
    .i_data(i_data),
    .o_data(o_data)
    );

    always #5 i_clk = ~i_clk;

    initial begin
        i_clk = 0;
        i_ce = 0;
        i_we = 0;
        i_address = 0;
        i_data = 0;

        #20 i_ce = 1; i_we = 1;
        for (integer i = 0; i < 64; i = i + 1) begin
            #20 i_address = i; i_data = i + 1;
        end

        #20 i_we = 0;

        for (integer i = 0; i < 64; i = i + 1) begin
            #20 i_address = i; 
        end
        #20 $finish;
    end


endmodule
