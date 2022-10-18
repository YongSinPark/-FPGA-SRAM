`timescale 1ns / 1ps

module Static_ram(
    input i_clk,
    input i_rw,
    input i_ce,
    input [5:0] i_address,
    inout [7:0] io_data
    );

    reg [7:0] mem[0:63];
    reg [5:0] r_address;

    assign io_data = i_rw ? mem[r_address] : 8'bzzzzzzzz;

    always @(posedge i_clk) begin
        if(i_ce) begin
            if(!i_rw) begin
                mem[i_address] <= io_data;
            end
            else begin
                r_address <= i_address;
            end
        end
        else begin
        end
    end



    


endmodule
