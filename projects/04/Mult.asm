// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

  @R2      // M=R2
  M=0      // R2=0

  @R0      // M=R0
  D=M      // D=R0

  @END
  D;JLE    // if R0 <= 0 exit

  @R1      // M=R1
  D=M      // D=R1

  @END
  D;JLE    // if R1<=0 exit

  @i       // M=i (RAM[16])
  M=0      // i=0

(LOOP)

  @R1      // M=R1
  D=M      // D=R1

  @i       // M=i
  D=D-M    // D=R1-i

  @END
  D;JLE    // if i>R1 END 

  @i       // M=i
  M=M+1    // i=i+1

  @R2      // M=R2
  D=M      // D=R2

  @R0      // M=R0
  D=D+M    // D=D+R0

  @R2      // M=R2
  M=D      // R2=D

  @LOOP
  0;JMP


(END)
  @END
  0;JMP