% ASSUMPTION 1: assume that register R0 contains the address of the first word of the block of the initial key-stream
% ASSUMPTION 2: each word is 32 bits, so use LD and SD instead of LW and SD to load 32-bit words
% ASSUMPTION 3: words in the initial key-stream are stored consecutively in memory, address of second word is address of first world + 4 (bytes)

#define Ra => R1; Rb => R2; ; Rc => R3; Rd => R4	% define Ra, Rb, Rc, Rd
#define Rlo => R5; Rli => R6				% define loop counters for outer and inner loops

% initialize loop counters
LW.I	Rlo,#1024	% initialize loop counter for outer loop to 1024 for 1024 blocks
LW.I	Rli,#10		% initialize loop counter for outer loop to 10 for 10 iterations of DOUBLE-ROUND

outer_loop: % OUTER LOOP
	SUB.I	Rlo,#1	% decrement loop counter for outer loop by 1

inner_loop: % INNER LOOP
	SUB.I	Rli,#1	% decrement loop counter for inner loop by 1

	% odd round
	(unmodified B5 code)

	% even round
	(B5 code with modified load addressing)	% explained in report

	BNEZ	Rli,inner_loop	% repeat inner_loop if inner loop counter not 0
	% need to figure out if we need NO-OPs here or not?

	BNEZ	Rlo, outer_loop	% repeat outer loop if outer loop counter not 0
	ADD.I	R0,#64		% increment address to next block (4 * 16 bytes)