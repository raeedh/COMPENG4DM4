% ASSUMPTION 1: assume that register R0 contains the address of the first word of the block of the initial key-stream
% ASSUMPTION 2: each word is 32 bits, so use LD and SD instead of LW and SD to load 32-bit words
% ASSUMPTION 3: words in the initial key-stream are stored consecutively in memory, address of second word is address of first world + 4 (bytes)

#define Ra => R1; Rb => R2; ; Rc => R3; Rd => R4	% define Ra, Rb, Rc, Rd

% COLUMN 1 (QR(x[0], x[4], x[8], x[12]))

LD	Ra,(0)R0	% load a
LD	Rb,(16)R0	% load b
LD	Rc,(32)R0 	% load c
LD	Rd,(48)R0	% load d

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)

ADD	Rc,Rc,Rd	% c = c + d
XOR	Rb,Rb,Rc	% XOR(b,c)
ROT.L	Rb,Rb,#12	% ROTATE_LEFT(b, 12)

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
SD	(0)R0,Ra	% store a
ROT.L	Rd,Rd,#8	% ROTATE_LEFT(d, 8)

ADD	Rc,Rc,Rd	% c = c + d
SD	(48)R0,Rd	% store d
XOR	Rb,Rb,Rc	% XOR(b,c)
SD	(32)R0,Rc	% store c
ROT.L	Rb,Rb,#7	% ROTATE_LEFT(b, 7)

SD	(16)R0,Rb	% store b

% COLUMN 2 (QR(x[1], x[5], x[9], x[13]))

LD	Ra,(4)R0	% load a
LD	Rb,(20)R0	% load b
LD	Rc,(36)R0 	% load c
LD	Rd,(52)R0	% load d

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)

ADD	Rc,Rc,Rd	% c = c + d
XOR	Rb,Rb,Rc	% XOR(b,c)
ROT.L	Rb,Rb,#12	% ROTATE_LEFT(b, 12)

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
SD	(0)R0,Ra	% store a
ROT.L	Rd,Rd,#8	% ROTATE_LEFT(d, 8)

ADD	Rc,Rc,Rd	% c = c + d
SD	(48)R0,Rd	% store d
XOR	Rb,Rb,Rc	% XOR(b,c)
SD	(32)R0,Rc	% store c
ROT.L	Rb,Rb,#7	% ROTATE_LEFT(b, 7)

SD	(16)R0,Rb	% store b

% COLUMN 3 (QR(x[2], x[6], x[10], x[14]))

LD	Ra,(8)R0	% load a
LD	Rb,(24)R0	% load b
LD	Rc,(40)R0 	% load c
LD	Rd,(56)R0	% load d

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)

ADD	Rc,Rc,Rd	% c = c + d
XOR	Rb,Rb,Rc	% XOR(b,c)
ROT.L	Rb,Rb,#12	% ROTATE_LEFT(b, 12)

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
SD	(0)R0,Ra	% store a
ROT.L	Rd,Rd,#8	% ROTATE_LEFT(d, 8)

ADD	Rc,Rc,Rd	% c = c + d
SD	(48)R0,Rd	% store d
XOR	Rb,Rb,Rc	% XOR(b,c)
SD	(32)R0,Rc	% store c
ROT.L	Rb,Rb,#7	% ROTATE_LEFT(b, 7)

SD	(16)R0,Rb	% store b

% COLUMN 4 (QR(x[3], x[7], x[11], x[15]))

LD	Ra,(12)R0	% load a
LD	Rb,(28)R0	% load b
LD	Rc,(44)R0 	% load c
LD	Rd,(60)R0	% load d

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
ROT.L	Rd,Rd,#16	% ROTATE_LEFT(d, 16)

ADD	Rc,Rc,Rd	% c = c + d
XOR	Rb,Rb,Rc	% XOR(b,c)
ROT.L	Rb,Rb,#12	% ROTATE_LEFT(b, 12)

ADD	Ra,Ra,Rb	% a = a + b
XOR	Rd,Rd,Ra	% XOR(d,a)
SD	(0)R0,Ra	% store a
ROT.L	Rd,Rd,#8	% ROTATE_LEFT(d, 8)

ADD	Rc,Rc,Rd	% c = c + d
SD	(48)R0,Rd	% store d
XOR	Rb,Rb,Rc	% XOR(b,c)
SD	(32)R0,Rc	% store c
ROT.L	Rb,Rb,#7	% ROTATE_LEFT(b, 7)

SD	(16)R0,Rb	% store b