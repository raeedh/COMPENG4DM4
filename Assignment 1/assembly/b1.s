% ASSUMPTION 1: assume that register R0 contains the address of the first word of the block of the initial key-stream
% ASSUMPTION 2: each word is 32 bits, so use LD instead of LW to load 32-bit words
% ASSUMPTION 3: words in the initial key-stream are stored consecutively in memory, address of second word is address of first world + 4 (bytes))

% macros
#define Ra => R1; Rb => R2; Rd => R3	% define Ra, Rb, Rd

LD	Ra,(0)R0	% load a
LD	Rb,(16)R0	% load b
ADD	Ra,Ra,Rb	% a = a + b
SW	(0)R0,Ra	% store a

LD	Ra,(0)R0	% load a
LD	Rd,(48)R0	% load d
XOR	Rd,Rd,Rd	% XOR(d,a)
SW	(48)R0,Rd	% store d

LD	Rd,(48)R0	% load d	
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)
SW	(48)R0,Rd	% store d