function decVal = bruteForce(vect)
    for i=0:63
        c = decrypt(vect, i);
        disp([i, ": ", c]);
        mean = isMeaningful(c);
        if mean
            decVal = c;
        end
    end
end