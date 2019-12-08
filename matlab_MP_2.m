function [] = matlab_MP_2()
clc
x1 = input('Enter X-coordinate of FIRST POINT: ');
y1 = input('Enter Y-coordinate of FIRST POINT: ');

x2 = input('Enter X-coordinate of SECOND POINT: ');
y2 = input('Enter Y-coordinate of SECOND POINT: ');

x3 = input('Enter X-coordinate of THIRD POINT: ');
y3 = input('Enter Y-coordinate of THIRD POINT: ');

%--for getting the length of the line meeting the points--%
X12=x1-x2;
X13=x1-x3;
X31=x3-x1;
X21=x2-x1;
Y12=y1-y2;
Y13=y1-y3;
Y31=y3-y1;
Y21=y2-y1;
%--for solving the determinants of D/2, E/2, and F(denoted as D2, E2,and F respectively)--%
X2_X1=(x2^2)-(x1^2);
Y2_Y1=(y2^2)-(y1^2);
X1_X3=(x1^2)-(x3^2);
Y1_Y3=(y1^2)-(y3^2);

D2=((X1_X3*Y12)+(Y1_Y3*Y12)+(X2_X1*Y13)+(Y2_Y1*Y13))/(2*((X31*Y12)-(X21*Y13)));
E2=((X1_X3*X12)+(Y1_Y3*X12)+(X2_X1*X13)+(Y2_Y1*X13))/(2*((Y31*X12)-(Y21*X13)));
F2=-(x1^2)-(y1^2)-(2*D2*x1)-(2*E2*y1);

%--for solving the center(h,k) and redius(r) of the circle--%
h=-D2;
k=-E2;
rroot=(h*h)+(k*k)-F2;
root = sqrt(rroot);
radius=round(root,3)
center = [h,k]
vectors_DEF = [2*D2,2*E2,F2] %GE:X**2+Y**2+2X+2Y+F, where X is D2 and Y is E2

%for checkinig the circle%
theta = 0 : 0.01 : 2*pi;
x = radius* cos(theta) + h;
y = radius* sin(theta) + k;
figure
plot(x,y)
hold on
plot([x1,x2,x3,h],[y1,y2,y3,k],'d')
grid on
hold off
end
