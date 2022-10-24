% ASSUMPTION 1: assume that register R0 contains the address of the first word of the block of the initial key-stream
% ASSUMPTION 2: each word is 32 bits, so use LD and SD instead of LW and SD to load 32-bit words
% ASSUMPTION 3: words in the initial key-stream are stored consecutively in memory, address of second word is address of first world + 4 (bytes)

#define Ra => R1; Rb => R2; ; Rc => R3; Rd => R4	% define Ra, Rb, Rc, Rd

LD	Ra,(0)R0	% load a
LD	Rb,(16)R0	% load b
LD	Rd,(48)R0	% load d
LD	Rc,(32)R0 	% load c

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)

ADD	Rc,Rc,Rd	% c = c + d
XOR	Rb,Rb,Rc	% XOR(b,c)
ROT.L	Rb,Rb,#12	% ROTATE_LEFT(b, 12)

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
ROT.L	Rd,Rd,#8	% ROTATE_LEFT(d, 8)

ADD	Rc,Rc,Rd	% c = c + d
XOR	Rb,Rb,Rc	% XOR(b,c)
ROT.L	Rb,Rb,#7	% ROTATE_LEFT(b, 7)

SD	(0)R0,Ra	% store a
SD	(48)R0,Rd	% store d
SD	(32)R0,Rc	% store c
SD	(16)R0,Rb	% store b