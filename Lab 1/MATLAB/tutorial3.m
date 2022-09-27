clear all;   % clear all variables
clc;         % clear command window

% lets create a state-vector for the LFSR
S = zeros(1,32);

%S(1) = 1

S(1:4)   = [1, 0, 1, 0];
S(5:8)   = [1, 1, 0, 0];
S(9:16)  = [1, 1, 1, 1, 1, 1, 1, 1];
S(17:24) = [0, 0, 0, 0, 1, 1, 1, 1];
S(25:32) = [0, 0, 1, 1, 1, 1, 0, 0];
%S(9:12) = [1, 1, 1, 1];
%S(20:24) = [1, 1, 1, 1, 1];

DATA_OUT = zeros(1, 2^16);
next_num = 1; % next number to write, into DATA_OUT vector

S_inital = S

% initially, we have not found a period
found_period = 0;
period = 0;

% lets create a loop for the LFSR
for (time=1:100)

    ls_bit = S(1); % record the bit shifted out, at LEFT end

    % lets record the ls_bit as the random output bit
    DATA_OUT(next_num) = ls_bit;
    next_num = next_num + 1;

    S(1:31) = S(2:32);
    S(32) = ls_bit; % shift ls_bit back into the other end

    

    fprintf('here is the state-vector at time %g\n', time);
    fprintf('%g, ', S); % print one number, repeat for all the numbers in the vector
    fprintf('\n\n'); % start a new line

    if (S == S_inital)
        fprintf('The state at time %g = the initial state; we are done\n', time);
        found_period = 1;
        period = time;
        break;
    end

end % end for (time = ...)

if (found_period == 1)
    fprintf('\nFound period = %g clock ticks, here are the random bits\n', period);

    fprintf('%g, ', DATA_OUT(1:period)); % print one number, repeat for all numbers in the vector
    fprintf('\n\n'); % start a new line

    fprintf('Here is a decimal representation\n');
    num_bytes = floor(period/8);

    % print a decimal numer for each byte in DATA_OUT
    for j=1:num_bytes;

        msb = (j-1)*8+1;
        lsb = msb + 8 - 1;
        
        BITS = DATA_OUT(msb:lsb); % select the bits to convert to decimal

        % BITS_str = str(BITS)
        integer = num2str(flip(BITS));
        integer = bin2dec(integer);
        fprintf('%g ', integer);
    end
    fprintf('\n') % start a new line
else
    fprintf('DID NOT FIND PERIOD !!!! \n');
end
fprintf('\nWe are finished\n');