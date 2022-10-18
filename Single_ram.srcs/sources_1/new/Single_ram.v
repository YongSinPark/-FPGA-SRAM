`timescale 1ns / 1ps

module Single_ram(
    input i_clk,
    input i_ce,
    input i_we,
    input [5:0] i_address,
    input [7:0] i_data,
    output [7:0] o_data
    );

    reg [7:0] mem [0:63];
    reg [5:0] r_address;
    assign data = mem[r_address];
    
    always @(posedge i_clk) begin
        if (i_ce) begin
            if(i_we) begin
                mem[i_address] <= i_data;
            end
            r_address <= r_address + 1;
        end
        else begin  
        end 
    end

endmodule
