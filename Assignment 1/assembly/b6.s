% ASSUMPTION 1: assume that register R0 contains the address of the first word of the block of the initial key-stream
% ASSUMPTION 2: each word is 32 bits, so use LD and SD instead of LW and SD to load 32-bit words
% ASSUMPTION 3: words in the initial key-stream are stored consecutively in memory, address of second word is address of first world + 4 (bytes)
% ASSUMPTION 4: assume dual-ported memory that allows simultaneous read+read, read+write, write+write

#define Ra => R1; Rb => R2; ; Rc => R3; Rd => R4	% define Ra, Rb, Rc, Rd
#define Rlo => R5; Rli => R6	% define loop counters for outer and inner loops

LW.I	Rlo,#1023	% initialize loop counter for outer loop for 1024 blocks

outer_loop: % OUTER LOOP
	LW.I	Rli,#9	% initialize loop counter for inner loop for 10 iterations of DOUBLE-ROUND

inner_loop: % INNER LOOP
	% odd round
	Insert RISC code from B5 for one round

	% even round
	Insert RISC code from B5 for one round with diagonal addressing and excluding last store	% changed addressing

	BNEZ	Rli,inner_loop	% repeat inner_loop if inner loop counter not 0
	SD	(x)R0,Rb	% last store from 
	SUB.I	Rli,#1	% decrement loop counter for inner loop by 1

	BNEZ	Rlo, outer_loop	% repeat outer loop if outer loop counter not 0
	ADD.I	R0,#64	% increment address to next block (4 * 16 bytes)
	SUB.I	Rlo,#1	% decrement loop counter for outer loop by 1