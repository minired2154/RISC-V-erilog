/*
 * RAM
*/

module mem (
    input wire rst_i,

    //from exe_mem
    input wire[`RegAddrBus] reg_waddr_i,
    input wire reg_we_i,
    input wire[`RegBus] reg_wdata_i,

    //to mem_wb
    output reg[`RegAddrBus] reg_waddr_o,
    output reg reg_we_o,
    output reg[`RegBus] reg_wdata_o
);
    always @(*) begin
        if (rst_i == `RstEnable) begin
            reg_waddr_o <= `ZeroReg;
            reg_we_o <= `WriteDisable;
            reg_wdata_o <= `ZeroWord;
        end else begin
            reg_waddr_o <= reg_waddr_i;
            reg_we_o <= reg_we_i;
            reg_wdata_o <= reg_wdata_i;
        end
    end
endmodule