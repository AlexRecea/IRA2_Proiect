%coloana 1: timp
%coloana 2: Azimuth
%coloana 3: Azimuth21
%coloana 4: Pitch
%coloana 5: Pitch12
%intrareAzimuth: 0.2
%intrarePitch: 0.3

close all
time = tout(:, 1);
azimuth = tout (:, 2);
azimuth21 = tout (:, 3);
pitch = tout (:, 4);
pitch12 = tout (:, 5);
azimuth_input = tout (:, 6);
pitch_input = tout (:, 7);


% plot(time, u1)
% plot(time, pitch)
Te = time(2) - time(1);

data_azimuth_id = iddata(azimuth, azimuth_input, Te);
data_pitch_id = iddata(pitch, pitch_input, Te);
data_azimuth21_id = iddata(azimuth21, azimuth_input, Te);
data_pitch12_id = iddata(pitch12, pitch_input, Te);

nA = 2;
nB = 2;
nC = 1;
nD = 2;

armax_model_azimuth = armax(data_azimuth_id, [nA, nB, nC, nD]);
H_Azimuth_11 = tf (armax_model_azimuth.B, armax_model_azimuth.A, Te)
armax_model_pitch = armax(data_pitch_id, [nA, nB, nC, nD]);
H_Pitch_22 = tf (armax_model_pitch.B, armax_model_pitch.A, Te)
armax_model_azimuth21 = armax(data_azimuth21_id, [1 1 1 1]);
H_Azimuth_21 = tf (armax_model_azimuth21.B, armax_model_azimuth21.A, Te)
armax_model_pitch12 = armax(data_pitch12_id, [1 1 1 1]);
H_Pitch_12 = tf (armax_model_pitch12.B, armax_model_pitch12.A, Te)

figure
subplot (221)
step(H_Azimuth_11)
title ("Step Response for Azimuth Input")
subplot (222)
step(H_Pitch_12)
title ("Step Response for Azimuth Input")
subplot (223)
step(H_Azimuth_21)
title ("Step Response for Pitch Input")
subplot(224)
step(H_Pitch_22)
title ("Step Response for Pitch Input")
% figure, compare(armax_model_azimuth, data_azimuth_id)

