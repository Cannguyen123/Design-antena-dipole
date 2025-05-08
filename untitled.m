% Thiết kế mảng anten dipole tuyến tính đều 19 phần tử
clc; clear; close all;

% Thông số mảng anten
N = 19;              % Số phần tử
lambda = 1;          % Bước sóng chuẩn hóa
d = lambda / 4;      % Khoảng cách giữa các phần tử
theta0 = 30;         % Góc hướng búp chính (độ)
k = 2 * pi / lambda; % Số sóng
beta = -k * d * cosd(theta0); % Pha kích thích tiến

% Hàm bức xạ anten dipole đơn giản
theta = linspace(0, 180, 1000); % Góc quét
phi = linspace(0, 360, 360);
[Theta, Phi] = meshgrid(theta, phi);

% Hàm mảng dipole
psi = k * d * cosd(Theta) + beta;
AF = abs(sin(N * psi / 2) ./ sin(psi / 2));
AF = AF / max(AF(:)); % Chuẩn hóa

% Hàm bức xạ của dipole
radiation_pattern = sin(deg2rad(Theta)); % Bức xạ dipole (sin(θ))

% Chuyển sang tọa độ cầu -> Đồ thị 3D
X = AF .* radiation_pattern .* sind(Theta) .* cosd(Phi);
Y = AF .* radiation_pattern .* sind(Theta) .* sind(Phi);
Z = AF .* radiation_pattern .* cosd(Theta);

% Vẽ đồ thị 3D
figure;
surf(X, Y, Z, AF, 'EdgeColor', 'none');
colormap jet;
colorbar;
title('Biểu đồ 3D hàm mảng anten dipole tuyến tính đều 19 phần tử');
xlabel('X'); ylabel('Y'); zlabel('Z');
axis equal;
view(45, 30);
