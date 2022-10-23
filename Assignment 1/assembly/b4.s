LW		R0,(0)Ra	% load a
LW		R1,(0)Rb	% load b
LW		R2,(0)Rc 	% load c
LW		R3,(0)Rd	% load d

% line 1
ADD		R0,R1,R0	% a += b
% line 4
ADD		R2,R3,R2	% c = c + d
% line 2
XOR		R3,R0,R3	% XOR(d,a)
% line 5
XOR		R1,R1,R2	% XOR(b,c)
% line 3
ROT.L	R3,R3,#16	% ROTATE_LEFT(d, 16)
% line 6
ROT.L	R1,R1,#12	% ROTATE_LEFT(b, 12)

% line 7
ADD		R0,R1,R0	% a = a + b
% line 10
ADD		R2,R3,R2	% c = c + d
% line 8
XOR		R3,R0,R3	% XOR(d,a)
% line 11
XOR		R1,R1,R2	% XOR(b,c)
% line 9
ROT.L	R3,R3,#8	% ROTATE_LEFT(d, 8)
% line 12
ROT.L	R1,R1,#7	% ROTATE_LEFT(b, 7)

SW		(0)Ra,R0	% store a
SW		(0)Rc,R2	% store c
SW		(0)Rd,R3	% store d
SW		(0)Rb,R1	% store b