# Single cycle code from on Harris and Harris second edition

This code is taken from Digital Design and Computer Architecture by Harris and Harris.  

## What did I change in this repo?

Three changes are made to the code in this repo:
1. Implementing the `lb` instruction. It is an I-type instruction which is the same as `lw` but it stores the first byte seen on the given address. The Opcode for this instruction is `100000`.
2. Implementing the `jr` instruction. This instruction loads the `$ra`  into `$pc`. It's an `r-type` instruction. The Opcode and funct for this instruction in order are `000000` and `001000`.
3. Implementing the `jalr` instruction.

## How to test the code?

There is a test bench file named `testbench.sv` and a file `memfile.dat` which holds the program to be tested. The assembly program which is equivalent of the machine codes written in `memfile.dat` is in the file `instructions.txt`. Consider reading `testbench.sv` and `instructions.txt` in order to figure out how the testing is going on.
