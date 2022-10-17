`timescale 1ns / 1ps

module Single_ram(
    input i_clk,
    input i_ce,
    input i_we,
    input [5:0] i_address,
    input [7:0] i_data,
    output [7:0] o_data
    );
    // FPGA를 이용한 가속기에 이용, SW가 아닌 HW에서 데이터를 처리하기 위해 사용

    reg [7:0] mem [0:63];
    reg [5:0] r_address = 0;

    assign o_data = mem[r_address];
    
    always @(posedge i_clk) begin
        if (i_ce) begin
            if(i_we) begin
                mem[i_address] <= i_data;
            end
            r_address <= i_address;
        end
        else begin  
        end 
    end

endmodule
