%% B1
clear all;
clc;

% input image file here
% max number of pixels is 174762, or 418x418 if image is square
image_path = "images\dimorphos_original.png";
A = imread(image_path);

fprintf("Input image is %s\n", image_path);
fprintf("Image size is %dx%d.\n",size(A,1),size(A,2));

if (size(A,1)*size(A,2) > 174762)
    prompt = "Image is too large to process, do you wish to resize? Y/n\n";
    x = input(prompt,"s");
    if (x == 'Y') || (x == 'y')
        fprintf("Resizing image to 418x418.\n");
        A = imresize(A,[418, 418]);
    else
        fprintf("Exitting script, please input valid input (less than 174762 pixels, or 418x418).\n");
        return
    end
end

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
