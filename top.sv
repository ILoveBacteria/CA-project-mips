module top(input  logic        clk, reset, 
           output logic [31:0] writedata, dataadr, 
           output logic        memwrite);

  logic [31:0] pc, instr, readdata;
  logic membyteread;
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, membyteread, dataadr, 
            writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, membyteread, dataadr, writedata, readdata);
endmodule


