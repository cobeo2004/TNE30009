function [ c ] = encrypt( m,key )
%encrypt  
% does simple transposition and substitution encryption of 
% string m using key k to return cipher text c 
% block cipher. 
% Expects m to be 16 bytes in length
% Key k is integer one byte long, between 0 and 63
% returns c 16 bytes in length
% Philip Branch 23/05/14


if length(m) ~= 16
    disp 'error: input length must be 16'
end

if key > 63
    disp 'error: key must be between 0 and 63'
end

num(1:16) = 0;
%convert plain text string into numeric ('A' to 1, 'B' to 2 etc)
alphaArray = ['ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:(). '];
for i = 1:length(m)
    num(i) = 0;
    for j = 1:length(alphaArray)
        if(m(i) == alphaArray(j))
            num(i) = j;
        end
    end;
end

% convert num to 4 x 4 matrix
mat = vec2mat(num,4);

%row operations
for i = 1:4
    tmp = mat(i,:);
    tmp = tmp';
    tmp = circshift(tmp,i-1);
    tmp = tmp';
    mat(i,:) = tmp(:);
end

%finish by turning matrix back into a vector
vec = [mat(1,:) mat(2,:) mat(3,:) mat(4,:)];

%apply the key by xor each byte of it. Key is one byte long between 0 and
%63
vec = bitxor(vec,key);

%finish by returning vec in c
c = vec;
end


