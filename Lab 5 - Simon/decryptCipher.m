function decryptMsg = decryptCipher(n, e, c) 
    g = factor(n); % Factorize the given ‘n’ and store the prime number in array ‘g’.
    p = g(1); % Extract the first largest positive prime number. 
    q = g(2); % Extract the second largest positive prime number.

    phiOfN = ((p - 1) * (q - 1)); % Calculate the Euler’s totient function phi(n).
    for i = 1:n % Iterate to ‘n’ to find ‘d'.
        if mod((i * e), phiOfN) == 1 % Condition to find the multiplicative inverse: 
                                     % (d*e) mod (phi(n)) equals 1 or not.
            d = i; % Assigns ‘i’ to ‘d’ once modular inverse is found.
        end
    end
    decryptMsg = decryptString(n, d, c) % Calls for decryptstring function and return the value.
end

