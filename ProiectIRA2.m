a1 = 0.0135; %main rotor coeficient
b1 = 0.0924; %main rotor coeficient
a2 = 0.02; %tail rotor coeficient
b2 = 0.09; %tail rotor coeficient
Mg = 0.32; %moment of gravity
B1thetaV = 0.003; %friction momentum

A11 = [ 0               1       0   0;
        -Mg/l1  -B1thetaV/l1    0   0;
        0               0       0   1;
        0               0       0   -B1thetaH/l2];

A12 = [ 0                           0                   0;
        0                       (2*a1+b1)/l1            0;
        Kc(T0+Tp)/(Tp^2)        Kc*T0*(2*a1+b1)/I2/Tp   (2*a2+b2)/I2];

A21 = [ 0 0 0 0;
        0 0 0 0;
        0 0 0 0];

A22 = [ -1/Tp           2*a1+b1         0;
        0               -T10/T11        0;
        0               0               -T20/T21];

A = [A11 A12;
     A21 A22];

B = [0 0 0 0 0 K1/T11 0;
     0 0 0 0 0 0 K2/T21]
B = B';




