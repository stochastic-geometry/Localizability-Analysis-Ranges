function location = genUniLoc(r,number)

rho = r.^2 * rand(number,1);
phi = 2*pi * rand(number,1);

location = sqrt(rho) .* cos(phi) + 1j * sqrt(rho) .* sin(phi);

end

