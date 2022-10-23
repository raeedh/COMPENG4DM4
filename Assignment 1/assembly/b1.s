LW		R0,(0)Ra	% load a
LW		R1,(0)Rb	% load b
ADD		R0,R1,R0	% a = a + b
SW		(0)Ra,R0	% store a

LW		R0,(0)Ra	% load a
LW		R2,(0)Rd	% load d
XOR		R2,R0,R2	% XOR(d,a)
SW		(0)Rd,R2	% store d

LW		R2,(0)Rd	% load d	
ROT.L	R2,R2,#16	% ROTATE_LEFT(d, 16)
SW		(0)Rd,R2	% store d