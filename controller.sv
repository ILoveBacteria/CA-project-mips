module controller(input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output logic       pcsrc, alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump, jumpr,
                  output logic       membyteread,
                  output logic [2:0] alucontrol);

  logic [1:0] aluop;
  logic       branch;

  maindec md(op, memtoreg, memwrite, branch,
             alusrc, regdst, regwrite, jump, membyteread, aluop);
  aludec  ad(funct, aluop, alucontrol);

  assign pcsrc = branch & zero;
  assign jumpr = (op == 6'b000000) && (funct == 6'b001000) ? 1 : 0;
endmodule


