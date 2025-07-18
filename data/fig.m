%%
load("data.mat");
% 点到点全局
x = datasibgle(:,1);
y = datasibgle(:,2);

% 计算累积弧长
dx = diff(x);
dy = diff(y);
ds = sqrt(dx.^2 + dy.^2);
s = [0; cumsum(ds)];

n = length(x);

% 初始化导数矩阵
x_prime = zeros(n,1);
y_prime = zeros(n,1);

% 计算一阶导数（中心差分）
for i = 2:n-1
    h = s(i+1) - s(i-1);
    x_prime(i) = (x(i+1) - x(i-1)) / h;
    y_prime(i) = (y(i+1) - y(i-1)) / h;
end

% 端点处理（前向/后向差分）
x_prime(1) = (x(2) - x(1)) / (s(2) - s(1));
y_prime(1) = (y(2) - y(1)) / (s(2) - s(1));
x_prime(end) = (x(end) - x(end-1)) / (s(end) - s(end-1));
y_prime(end) = (y(end) - y(end-1)) / (s(end) - s(end-1));

% 计算二阶导数
x_double_prime = zeros(n,1);
y_double_prime = zeros(n,1);

for i = 2:n-1
    h = s(i+1) - s(i-1);
    x_double_prime(i) = (x_prime(i+1) - x_prime(i-1)) / h;
    y_double_prime(i) = (y_prime(i+1) - y_prime(i-1)) / h;
end

% 端点处理
x_double_prime(1) = (x_prime(2) - x_prime(1)) / (s(2) - s(1));
y_double_prime(1) = (y_prime(2) - y_prime(1)) / (s(2) - s(1));
x_double_prime(end) = (x_prime(end) - x_prime(end-1)) / (s(end) - s(end-1));
y_double_prime(end) = (y_prime(end) - y_prime(end-1)) / (s(end) - s(end-1));

% 计算曲率
numerator = abs(x_prime.*y_double_prime - y_prime.*x_double_prime);
denominator = (x_prime.^2 + y_prime.^2).^1.5;
curvature = zeros(n,1);
valid = denominator ~= 0;
curvature(valid) = numerator(valid) ./ denominator(valid);
curvature_filtered = medfilt1(curvature, 120); % 中值滤波去脉冲噪声

% 绘制结果
figure('Position', [100 100 1200 500])

% 原始曲线
subplot(1,2,1)
plot(x, y, 'b-', 'LineWidth', 1.5, 'DisplayName','原始轨迹') 
title('运动轨迹分析', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
xlabel('X坐标/m', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
ylabel('Y坐标/m', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
legend('show', 'Location','northeast', 'FontSize',16, 'FontWeight','bold')
ax = gca;
ax.FontSize = 14;  % 主刻度字号
axis equal

% 曲率曲线
subplot(1,2,2)
plot(s, curvature_filtered, 'r-', 'LineWidth', 1.5,'DisplayName','轨迹曲率')
title('曲率随弧长变化', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
xlabel('弧长/m', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
ylabel('曲率', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
legend('show', 'Location','northeast', 'FontSize',16, 'FontWeight','bold')
ax = gca;
ax.FontSize = 14;  % 主刻度字号
grid on

% 调整坐标轴范围
curvature_max = max(curvature_filtered(2:end-1)); % 排除端点
if curvature_max > 0
    ylim([0 curvature_max*1.1])
end
%%
load("data.mat");
% 多航点全局
x = datamuti(:,1);
y = datamuti(:,2);

% 计算累积弧长
dx = diff(x);
dy = diff(y);
ds = sqrt(dx.^2 + dy.^2);
s = [0; cumsum(ds)];

n = length(x);

% 初始化导数矩阵
x_prime = zeros(n,1);
y_prime = zeros(n,1);

% 计算一阶导数（中心差分）
for i = 2:n-1
    h = s(i+1) - s(i-1);
    x_prime(i) = (x(i+1) - x(i-1)) / h;
    y_prime(i) = (y(i+1) - y(i-1)) / h;
end

% 端点处理（前向/后向差分）
x_prime(1) = (x(2) - x(1)) / (s(2) - s(1));
y_prime(1) = (y(2) - y(1)) / (s(2) - s(1));
x_prime(end) = (x(end) - x(end-1)) / (s(end) - s(end-1));
y_prime(end) = (y(end) - y(end-1)) / (s(end) - s(end-1));

% 计算二阶导数
x_double_prime = zeros(n,1);
y_double_prime = zeros(n,1);

for i = 2:n-1
    h = s(i+1) - s(i-1);
    x_double_prime(i) = (x_prime(i+1) - x_prime(i-1)) / h;
    y_double_prime(i) = (y_prime(i+1) - y_prime(i-1)) / h;
end

% 端点处理
x_double_prime(1) = (x_prime(2) - x_prime(1)) / (s(2) - s(1));
y_double_prime(1) = (y_prime(2) - y_prime(1)) / (s(2) - s(1));
x_double_prime(end) = (x_prime(end) - x_prime(end-1)) / (s(end) - s(end-1));
y_double_prime(end) = (y_prime(end) - y_prime(end-1)) / (s(end) - s(end-1));

% 计算曲率
numerator = abs(x_prime.*y_double_prime - y_prime.*x_double_prime);
denominator = (x_prime.^2 + y_prime.^2).^1.5;
curvature = zeros(n,1);
valid = denominator ~= 0;
curvature(valid) = numerator(valid) ./ denominator(valid);
curvature_filtered = medfilt1(curvature, 160); % 中值滤波去脉冲噪声

% 绘制结果
figure('Position', [100 100 1200 500])

% 原始曲线
subplot(1,2,1)
plot(x, y, 'b-', 'LineWidth', 1.5, 'DisplayName','原始轨迹') 
title('运动轨迹分析', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
xlabel('X坐标/m', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
ylabel('Y坐标/m', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
legend('show', 'Location','northeast', 'FontSize',16, 'FontWeight','bold')
ax = gca;
ax.FontSize = 14;  % 主刻度字号
axis equal

% 曲率曲线
subplot(1,2,2)
plot(s, curvature_filtered, 'r-', 'LineWidth', 1.5,'DisplayName','轨迹曲率')
title('曲率随弧长变化', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
xlabel('弧长/m', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
ylabel('曲率', 'FontSize',16, 'FontName','宋体', 'FontWeight','bold')
legend('show', 'Location','northeast', 'FontSize',16, 'FontWeight','bold')
ax = gca;
ax.FontSize = 14;  % 主刻度字号
grid on

% 调整坐标轴范围
curvature_max = max(curvature_filtered(2:end-1)); % 排除端点
if curvature_max > 0
    ylim([0 curvature_max*1.1])
end
%%
load("data.mat");
% 泊车场景
x = boche(1,:);
y = boche(2,:);
theta = boche(3,:);
gamma = boche(4,:);
omega = boche(5,1:end-1);
v = boche(6,:);
a = boche(7,:);
jerk = boche(8,1:end-1);
dt = boche(9,1:end-1);
t = [0, cumsum(dt)];% 生成累积时间刻度

% 设置画布
figure('Color', 'white', 'Position', [100, 100, 800, 600]);
% ----------------- 子图1：航向角 -----------------
subplot(4,1,1);
plot(t, theta, 'g--', 'LineWidth', 2);
ylabel('航向角/rad');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('航向角', 'Location', 'best');
%title('航向角随时间变化');
grid on;
% ----------------- 子图2：铰接角 -----------------
subplot(4,1,2);
plot(t, gamma, 'b', 'LineWidth', 2);
%xlabel('时间 (s)');
ylabel('铰接角/rad');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('铰接角', 'Location', 'best');
%title('铰接角随时间变化');
grid on;
% 调整子图间距
h = findobj(gcf, 'Type', 'axes');
set(h, 'FontSize', 14); % 统一字体大小

% 设置画布
%figure('Color', 'white', 'Position', [100, 100, 800, 600]);
% ----------------- 子图1：车体速度 -----------------
subplot(4,1,3);
plot(t, v, 'g--', 'LineWidth', 2);
ylabel('车体速度/[m/s]');
%ylim([0, 2]);           % 根据图片中的纵轴范围设置
legend('车体速度', 'Location', 'best');
%title('车体速度随时间变化');
grid on;

% ----------------- 子图2：加速度 -----------------
subplot(4,1,4);
plot(t, a, 'b', 'LineWidth', 2); 
xlabel('时间/s');
ylabel('加速度/[m/s^2]');
%ylim([-1, 1]);          % 根据图片中的纵轴范围设置
legend('加速度', 'Location', 'best');
%title('加速度随时间变化');
grid on;

% 调整子图间距
h = findobj(gcf, 'Type', 'axes');
set(h, 'FontSize', 14); % 统一字体大小

% 设置画布        输入
figure('Color', 'white', 'Position', [100, 100, 800, 600]);
% ----------------- 子图1：omega -----------------
subplot(2,1,1);
plot(t(:,2:end), omega, 'g--', 'LineWidth', 2);
ylabel('铰接角速度/[rad/s]');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('铰接角速度', 'Location', 'best');
%title('铰接角速度随时间变化');
grid on;
% ----------------- 子图2：jerk -----------------
subplot(2,1,2);
plot(t(:,2:end), jerk, 'b', 'LineWidth', 2);
xlabel('时间/s');
ylabel(' 加加速度/[m/s^3]');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('加加速度', 'Location', 'best');
%title('铰接角随时间变化');
grid on;
% 调整子图间距
h = findobj(gcf, 'Type', 'axes');
set(h, 'FontSize', 14); % 统一字体大小
%%
load("data.mat");
% 侧边停车场景
x = cebian(1,:);
y = cebian(2,:);
theta = cebian(3,:);
gamma = cebian(4,:);
omega = cebian(5,1:end-1);
v = cebian(6,:);
a = cebian(7,:);
jerk = cebian(8,1:end-1);
dt = cebian(9,1:end-1);
t = [0, cumsum(dt)];% 生成累积时间刻度

% 设置画布
figure('Color', 'white', 'Position', [100, 100, 800, 600]);
% ----------------- 子图1：航向角 -----------------
subplot(4,1,1);
plot(t, theta, 'g--', 'LineWidth', 2);
ylabel('航向角/rad');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('航向角', 'Location', 'best');
%title('航向角随时间变化');
grid on;
% ----------------- 子图2：铰接角 -----------------
subplot(4,1,2);
plot(t, gamma, 'b', 'LineWidth', 2);
%xlabel('时间 (s)');
ylabel('铰接角/rad');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('铰接角', 'Location', 'best');
%title('铰接角随时间变化');
grid on;
% 调整子图间距
h = findobj(gcf, 'Type', 'axes');
set(h, 'FontSize', 14); % 统一字体大小

% 设置画布
%figure('Color', 'white', 'Position', [100, 100, 800, 600]);
% ----------------- 子图1：车体速度 -----------------
subplot(4,1,3);
plot(t, v, 'g--', 'LineWidth', 2);
ylabel('车体速度/[m/s])');
%ylim([0, 2]);           % 根据图片中的纵轴范围设置
legend('车体速度', 'Location', 'best');
%title('车体速度随时间变化');
grid on;

% ----------------- 子图2：加速度 -----------------
subplot(4,1,4);
plot(t, a, 'b', 'LineWidth', 2); 
xlabel('时间/s');
ylabel('加速度/[m/s^2]');
%ylim([-1, 1]);          % 根据图片中的纵轴范围设置
legend('加速度', 'Location', 'best');
%title('加速度随时间变化');
grid on;

% 调整子图间距
h = findobj(gcf, 'Type', 'axes');
set(h, 'FontSize', 14); % 统一字体大小

% 设置画布        输入
figure('Color', 'white', 'Position', [100, 100, 800, 600]);
% ----------------- 子图1：omega -----------------
subplot(2,1,1);
plot(t(:,2:end), omega, 'g--', 'LineWidth', 2);
ylabel('铰接角速度/[rad/s]');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('铰接角速度', 'Location', 'best');
%title('铰接角速度随时间变化');
grid on;
% ----------------- 子图2：jerk -----------------
subplot(2,1,2);
plot(t(:,2:end), jerk, 'b', 'LineWidth', 2);
xlabel('时间/s');
ylabel(' 加加速度/[m/s^3]');
%ylim([-2.5, 2.5]);      % 根据图片中的纵轴范围设置
legend('加加速度', 'Location', 'best');
%title('铰接角随时间变化');
grid on;
% 调整子图间距
h = findobj(gcf, 'Type', 'axes');
set(h, 'FontSize', 14); % 统一字体大小

