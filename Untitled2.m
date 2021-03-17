a = input("Enter matrix A (in form [a ; b; c]) : ");
b = input("Enter matrix B (in the form [a; b; c]) : ");

fprintf(" Ax = B \n\n");

[fprintf("%d ", a(1,:)), fprintf("\t"), fprintf("   x"), fprintf("\t  "), fprintf("%d", b(1)), fprintf("\n")];
[fprintf("%d ", a(2,:)), fprintf("\t"), fprintf(" * y"), fprintf("\t= "), fprintf("%d", b(2)), fprintf("\n")];
[fprintf("%d ", a(3,:)), fprintf("\t"), fprintf("   z"), fprintf("\t  "), fprintf("%d", b(3)), fprintf("\n")];

fprintf("\nLet LU = A\n");
[fprintf("l(11)   0     0  \t    1 u(12) u(13)\t "), fprintf("\t   "), fprintf("%d  ", a(1,:)), fprintf("\n")];
[fprintf("l(21) l(22)   0  \t *  0  1    u(23)\t "), fprintf("\t=  "), fprintf("%d  ", a(2,:)), fprintf("\n")];
[fprintf("l(31) l(32) l(33)\t    0  0      1  \t "), fprintf("\t   "), fprintf("%d  ", a(3,:)), fprintf("\n\n\n")];

[fprintf("l(11)    l(11)u(12)             l(11)u(13)        "), fprintf("\t  "), fprintf("%d  ", a(1,:)), fprintf("\n")];
[fprintf("l(21) l(21)u(12)+l(22)    l(21)u(13)+l(22)u(23)   "), fprintf("\t= "), fprintf("%d  ", a(2,:)), fprintf("\n")];
[fprintf("l(31) l(31)u(12)+l(32) l(31)u(13)+l(32)u(23)+l(33)"), fprintf("\t  "), fprintf("%d  ", a(3,:)), fprintf("\n")];

l11 = a(1,1);
l21 = a(2,1);
l31 = a(3,1);
u12 = roots([l11 -a(1,2)]);
l22 = roots([1 l21*u12-a(2,2)]);
l32 = roots([1 l31*u12-a(3,2)]);
u13 = roots([l11 -a(1,3)]);
u23 = roots([l22 l21*u13-a(2,3)]);
l33 = roots([1 l31*u13+l32*u23-a(3,3)]);

fprintf("\n\nl(11) = %s\n",rats(l11))
fprintf("l(21) = %s\n",rats(l21))
fprintf("l(31) = %s\n",rats(l31))
fprintf("u(12) = %s\n",rats(u12))
fprintf("l(22) = %s\n",rats(l22))
fprintf("l(32) = %s\n",rats(l32))
fprintf("u(13) = %s\n",rats(u13))
fprintf("u(23) = %s\n",rats(u23))
fprintf("l(33) = %s\n\n",rats(l33))

[fprintf("%s      0            0          \t 1      %s%s\t ", rats(l11), rats(u12), rats(u13)), fprintf("   x \t  "), fprintf("%d  ", a(1,:)), fprintf("\n")];
[fprintf("%s%s      0       *  \t 0             1      %s\t ", rats(l21), rats(l22), rats(u23)), fprintf(" * y \t= "), fprintf("%d  ", a(2,:)), fprintf("\n")];
[fprintf("%s%s%s    \t 0             0             1      \t ", rats(l31), rats(l32), rats(l33)), fprintf("   z \t  "), fprintf("%d  ", a(3,:)), fprintf("\n")];

fprintf("\nLet LY = B   ,   UX = Y\n");

[fprintf("%s      0            0      \t ", rats(l11)), fprintf("   y1 \t  "), fprintf("%d  ", a(1,:)), fprintf("\n")];
[fprintf("%s%s      0      \t ", rats(l21), rats(l22)), fprintf(" * y2 \t= "), fprintf("%d  ", a(2,:)), fprintf("\n")];
[fprintf("%s%s%s\t ", rats(l31), rats(l32), rats(l33)), fprintf("   y3 \t  "), fprintf("%d  ", a(3,:)), fprintf("\n\n\n")];

final_l = [l11 0 0; l21 l22 0; l31 l32 l33];

final_y = final_l\b;

[fprintf("y1   %d\n", round(final_y(1),2)), fprintf("y2 = %d\n", round(final_y(2),2)), fprintf("y3   %d\n\n", round(final_y(3),2))];

fprintf("\nUX = Y\n");

final_ans = a\b;
[fprintf("x   %d\n", round(final_ans(1),2)), fprintf("y = %d\n", round(final_ans(2),2)), fprintf("z   %d\n\n", round(final_ans(3),2))];

