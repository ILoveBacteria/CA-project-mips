module mips(input  logic        clk, reset,
            output logic [31:0] pc,
            input  logic [31:0] instr,
            output logic        memwrite,
            output logic        membyteread,
            output logic [31:0] aluout, writedata,
            input  logic [31:0] readdata);

  logic       memtoreg, alusrc, alusrc_pc, regdst, 
              regwrite, jump, jumpr, pcsrc, zero;
  logic [2:0] alucontrol;

  controller c(instr[31:26], instr[5:0], zero,
               memtoreg, memwrite, pcsrc,
               alusrc, alusrc_pc, regdst, regwrite, jump, jumpr, membyteread,
               alucontrol);
  datapath dp(clk, reset, memtoreg, pcsrc,
              alusrc, alusrc_pc, regdst, regwrite, jump, jumpr,
              alucontrol,
              zero, pc, instr,
              aluout, writedata, readdata);
endmodule


