%% B1
clear all;
clc;

A = imread("images\dimorphos.png");

figure(1);
clf;
image_original = image(A);

%% B2
my_random_numbers;

%RAND_matrix = zeros(size(A));
RAND_matrix = RANDOM_DATA_OUT(1:numel(A));
RAND_matrix = reshape(RAND_matrix,size(A));

%% B3, B4

A_encrypted = zeros(size(A));
A_encrypted = uint8(A_encrypted);

for i = 1:numel(A_encrypted)
    A_encrypted(i) = bitxor(A(i), RAND_matrix(i));
end

figure(2);
clf;
image_encrypted = image(A_encrypted);

%% B5

A_decrypted = zeros(size(A_encrypted));
A_decrypted = uint8(A_decrypted);

for i = 1:numel(A_decrypted)
    A_decrypted(i) = bitxor(A_encrypted(i), RAND_matrix(i));
end

figure(3);
clf;
image(A_decrypted)
