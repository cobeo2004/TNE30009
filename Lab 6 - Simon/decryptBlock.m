function n = decryptBlock(ct, key, previous_ct)
    ct_xored = bitxor(ct, previous_ct)
    n = decrypt(ct_xored, key)
end