function [ m ] = decrypt( c,key )
%decrypt  
% does simple transposition and substitution decryption of 
% numeric vector c using key k to return plain text m. 
% block cipher. 
% Expects c to be 16 in length
% Key k is integer one byte long, between 0 and 63
% returns m 16 bytes in length
% Philip Branch


if length(c) ~= 16
    disp 'error: input length must be 16'
end

if key > 63
    disp 'error: key must be between 0 and 63'
end

%apply the key by xor each byte of it. Key is one byte long between 0 and
%64
c = bitxor(c,key);

% convert c to 4 x 4 matrix
mat = vec2mat(c,4);

%row operations
for i = 1:4
    tmp = mat(i,:);
    tmp = tmp';
    tmp = circshift(tmp,-i+1);
    tmp = tmp';
    mat(i,:) = tmp(:);
end

%finish by turning matrix back into a vector
vec = [mat(1,:) mat(2,:) mat(3,:) mat(4,:)];

%convert numeric into alpha ('A' to 1, 'B' to 2 etc)
alpha(1:16) = ' ';
alphaArray = ['ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:(). '];
for i = 1:length(vec)
    if (vec(i) > length(alphaArray))
        alpha(i) = '.';
    else
        if vec(i) < 1
            alpha(i) = '.';
        else
            alpha(i) = alphaArray(vec(i)); 
        end
    end
end

%finish by returning vec in c
m = alpha;
end


