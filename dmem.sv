module dmem(input  logic        clk, we, membyteread,
            input  logic [31:0] a, wd,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];
  logic [31:0] extended_rd;

  signext8 se(RAM[a[31:2]][7:0], extended_rd);

  assign rd = membyteread ? extended_rd : RAM[a[31:2]]; // word or byte aligned

  always_ff @(posedge clk)
    if (we) RAM[a[31:2]] <= wd;
endmodule


