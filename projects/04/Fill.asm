// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Variables:
// KBD
// SCREEN
// color = RAM[16]
// n = RAM[17]
// i = RAM[18]
// temp = RAM[19]

// Labels:
// INFINITE, ZERO, ONE, SETPIXELS


@color
M=0              // Set word=0

(INFINITE)

  @KBD
  D=M            // Get KBD value

  @ZERO
  D;JEQ          // If no key is pressed, set word=0

  @ONE
  D;JNE          // If a key is pressed, set word=-1

  (ZERO)
    @color
    M=0          // Set word=0
    @SETPIXELS
    0;JMP

  (ONE)
    @color
    M=-1         // Set word=-11

  (SETPIXELS)
    @8192        // Set n=8192
    D=A
    @n
    M=D

    @i           // Set i=0
    M=0

    (LOOP)       // Word loop
      @i         // if i==n exit
      D=M
      @n
      D=D-M
      @INFINITE
      D;JEQ

      @i         // A is the word to be set
      D=M
      @SCREEN
      D=D+A

      @temp      // temp is the work to be set
      M=D

      @color
      D=M        // D=color

      @temp      // A is the word to be set
      A=M
      M=D


      @i         // i=i+1
      M=M+1
      @LOOP
      0;JMP