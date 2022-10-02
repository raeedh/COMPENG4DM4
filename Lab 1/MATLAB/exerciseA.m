%% Clear workspace
clear all;
clc;

%% A1, A2, A3

% Create state-vector for LFSR with 22 bits
S = zeros(1,22);

% Set initial-state of LFSR to (0,0,1) decimal
S(1) = 1; % S(1) is LSB
S_initial = S; % store initial state of S

% Create large output vector to store output stream
DATA_OUT = zeros(1, 2^22);

% Observe LSFR for 5000000 clock ticks
for time = 1:5000000
    % Store bit to be shifted out (LSB found on LEFT end of vector)
    LSB = S(1);
    DATA_OUT(time) = LSB; % Store shifted bit into output
    
    % Shift bits that are not part of feedback polynomial
    S(1:20) = S(2:21);
    
    % Feedback polynomial is x^22 + x^21 + 1
    S(21) = xor(S(22),LSB); % XOR LSB with bit 22 to generate bit 21
    S(22) = LSB; % Shift LSB into MSB (bit 22)

    % check if we have returned to the initial state
    if S == S_initial
        period = time;
        fprintf('The state at time %d = the initial state, the period is %d.\n', time, period);
        break;       
    end
end

%% A3, A4
if exist('period', 'var') == 0
    fprintf(2,'DID NOT FIND PERIOD !!!! \n');
else
    fprintf('Printing random numbers to file my_random_numbers.m...\n');
    num_bytes = ceil(period/8);
    
    fid = fopen('my_random_numbers.m', 'w');
    
    fprintf(fid, 'num_bytes = %d;\n', num_bytes);
    fprintf(fid, 'RANDOM_DATA_OUT(1:num_bytes) = [...\n');
    
    BITS = DATA_OUT(1:period);
    BITS = [BITS, zeros(1, 8-mod(period, 8))];
    BITS = flip(BITS);
    
    byte = 1;
    
    while byte <= num_bytes   
        DEC = num2str(BITS(byte*8-7:byte*8));
        DEC = bin2dec(DEC);
        fprintf(fid, '%d, ',DEC);
        
        if mod(byte,16) == 0
            fprintf(fid, '...\n');
        end
        byte = byte + 1;
    end
    
    fprintf(fid, '...\n];');
    fclose(fid);
    fprintf('Finished printing random numbers to file my_random_numbers.m\n');
end

%% A5, A6

% https://www.mathworks.com/matlabcentral/answers/459701-counting-consecutive-occurences-of-1s-and-1s
changeBits = [1,diff(BITS(1:end-1))]~=0;
counts = histcounts(cumsum(changeBits),1:sum(changeBits)+1);
bitSequences = [BITS(changeBits)',counts'];

zeroruns_table = zeros(4,24); oneruns_table = zeros(4,24);

% first row of table
zeroruns_table(1,1:24) = 1:24;
oneruns_table(1,1:24) = 1:24;

% second row of table
for i = 1:size(bitSequences,1)
    if (bitSequences(i,2) <= 25)
        if bitSequences(i,1) == 0
            oneruns_table(2,bitSequences(i,2)) = oneruns_table(2,bitSequences(i,2)) + 1;
        else
            zeroruns_table(2,bitSequences(i,2)) = zeroruns_table(2,bitSequences(i,2)) + 1;
        end
    end
end

% third row of table
totalZeros = sum(zeroruns_table(1,:) .* zeroruns_table(2,:));
totalOnes = sum(oneruns_table(1,:) .* oneruns_table(2,:));
for i = 1:24
   oneruns_table(3,i) = oneruns_table(2,i) / sum(oneruns_table(2,:));
   zeroruns_table(3,i) = zeroruns_table(2,i) / sum(zeroruns_table(2,:));
end

% fourth row of table
for i = 1:24
   oneruns_table(4,i) = 2^-oneruns_table(1,i);
   zeroruns_table(4,i) = 2^-zeroruns_table(1,i);
end