% lines 1-3
LW	R0,(0)Ra	% load a
LW	R1,(0)Rb	% load b
ADD	R0,R1,R0	% a = a + b
SW	(0)Ra,R0	% store a

LW	R0,(0)Ra	% load a
LW	R3,(0)Rd	% load d
XOR	R3,R0,R3	% XOR(d,a)
SW	(0)Rd,R3	% store d

LW	R3,(0)Rd	% load d	
ROT.L	R3,R3,#16	% ROTATE_LEFT(d, 16)
SW	(0)Rd,R3	% store d

% lines 4-6
LW	R2,(0)Rc	% load c
LW	R3,(0)Rd	% load d
ADD	R2,R3,R2	% c = c + d
SW	(0)Rc,R2	% store c

LW	R1,(0)Rb	% load b
LW	R2,(0)Rc	% load c
XOR	R1,R1,R2	% XOR(b,c)
SW	(0)Rb,R1	% store b

LW	R1,(0)Rb	% load b	
ROT.L	R1,R1,#12	% ROTATE_LEFT(b, 12)
SW	(0)Rb,R1	% store b

% lines 7-9
LW	R0,(0)Ra	% load a
LW	R1,(0)Rb	% load b
ADD	R0,R1,R0	% a = a + b
SW	(0)Ra,R0	% store a

LW	R0,(0)Ra	% load a
LW	R3,(0)Rd	% load d
XOR	R3,R0,R3	% XOR(d,a)
SW	(0)Rd,R3	% store d

LW	R3,(0)Rd	% load d	
ROT.L	R3,R3,#8	% ROTATE_LEFT(d, 8)
SW	(0)Rd,R3	% store d

% lines 10-12
LW	R2,(0)Rc	% load c
LW	R3,(0)Rd	% load d
ADD	R2,R3,R2	% c = c + d
SW	(0)Rc,R2	% store c

LW	R1,(0)Rb	% load b
LW	R2,(0)Rc	% load c
XOR	R1,R1,R2	% XOR(b,c)
SW	(0)Rb,R1	% store b

LW	R1,(0)Rb	% load b	
ROT.L	R1,R1,#7	% ROTATE_LEFT(b, 7)
SW	(0)Rb,R1	% store b