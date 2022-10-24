% ASSUMPTION 1: assume that register R0 contains the address of the first word of the block of the initial key-stream
% ASSUMPTION 2: each word is 32 bits, so use LD and SD instead of LW and SD to load 32-bit words
% ASSUMPTION 4: words in the initial key-stream are stored consecutively in memory, address of second word is address of first world + 4 (bytes)

#define Ra => R1; Rb => R2; ; Rc => R3; Rd => R4	% define Ra, Rb, Rc, Rd

% lines 1-3
LD	Ra,(0)R0	% load a
LD	Rb,(16)R0	% load b
ADD	Ra,Ra,Rb	% a = a + b
SD	(0)R0,Ra	% store a

LD	Ra,(0)R0	% load a
LD	Rd,(48)R0	% load d
XOR	Rd,Rd,Rd	% XOR(d,a)
SD	(48)R0,Rd	% store d

LD	Rd,(48)R0	% load d	
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)
SD	(48)R0,Rd	% store d

% lines 4-6
LW	Rc,(32)R0	% load c
LW	Rd,(48)R0	% load d
ADD	Rc,Rc,Rd	% c = c + d
SD	(32)R0,Rc	% store c

LW	Rb,(16)R0	% load b
LW	Rc,(32)R0	% load c
XOR	Rb,Rb,Rc	% XOR(b,c)
SD	(16)R0,Rb	% store b

LW	Rb,(16)R0	% load b	
ROT.L	Rb,Rb,#12	% ROTATE_LEFT(b, 12)
SD	(16)R0,Rb	% store b

% lines 7-9
LD	Ra,(0)R0	% load a
LD	Rb,(16)R0	% load b
ADD	Ra,Ra,Rb	% a = a + b
SD	(0)R0,Ra	% store a

LD	Ra,(0)R0	% load a
LD	Rd,(48)R0	% load d
XOR	Rd,Rd,Rd	% XOR(d,a)
SD	(48)R0,Rd	% store d

LD	Rd,(48)R0	% load d	
ROT.L	Rd,Rd,#8	% ROTATE_LEFT(d, 8)
SD	(48)R0,Rd	% store d

% lines 10-12
LW	Rc,(32)R0	% load c
LW	Rd,(48)R0	% load d
ADD	Rc,Rc,Rd	% c = c + d
SD	(32)R0,Rc	% store c

LW	Rb,(16)R0	% load b
LW	Rc,(32)R0	% load c
XOR	Rb,Rb,Rc	% XOR(b,c)
SD	(16)R0,Rb	% store b

LW	Rb,(16)R0	% load b	
ROT.L	Rb,Rb,#7	% ROTATE_LEFT(b, 7)
SD	(16)R0,Rb	% store b