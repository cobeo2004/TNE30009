function ePoint = main()
ct1 = [ 29 21 51 23 35 17 34 51 57 51 34 44 21 21 51 39] %Key: 10
ct2 = [ 12 38 20 63 16 50 4 23 30 23 54 5 55 2 38 54]
ct3 = [ 63 55 60 42 35 35 16 29 58 36 32 32 34 49 49 13]
ct4 = [ 46 21 15 13 3 54 5 46 24 0 12 53 17 21 25 52]
ct5 = [ 59 51 26 62 39 18 45 63 13 21 63 23 54 38 61 32]
ct6 = [ 24 0 12 43 5 33 57 28 62 41 42 37 26 55 31 43]
ct7 = [ 43 30 41 13 56 8 27 55 13 26 25 22 41 4 44 24]
% most meaningful key of ct1
key = 10
% Decrypt each block
pt1 = decryptBlock(ct1, key, zeros(1, 16))
pt2 = decryptBlock(ct2, key, ct1)
pt3 = decryptBlock(ct3, key, ct2)
pt4 = decryptBlock(ct4, key, ct3)
pt5 = decryptBlock(ct5, key, ct4)
pt6 = decryptBlock(ct6, key, ct5)
pt7 = decryptBlock(ct7, key, ct6);

plain_text = [pt1 pt2 pt3 pt4 pt5 pt6 pt7]
disp('Decrypted message: ')
disp(plain_text)
end