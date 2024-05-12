%coloana 1: timp
%coloana 2: Azimuth
%coloana 3: Azimuth21
%coloana 4: Pitch
%coloana 5: Pitch12
%intrareAzimuth: 0.2
%intrarePitch: 0.3


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

nA = 2;
nB = 2;
nC = 1;
nD = 2 ;
armax_model_azimuth = armax(data_azimuth_id, [nA, nB, nC, nD])

figure, compare(armax_model_azimuth, data_azimuth_id)

