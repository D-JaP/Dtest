% xyzraw = sortrows(xyzraw,'x6','ascend');
Xofs=sum(xyzraw.x1+xyzraw.x2+xyzraw.x3+xyzraw.x4+xyzraw.x5+xyzraw.x6)/6/200;
Yofs=sum(xyzraw.y1+xyzraw.y2+xyzraw.y3+xyzraw.y4+xyzraw.y5+xyzraw.y6)/6/200;
Zofs=sum(xyzraw.z1+xyzraw.z2+xyzraw.z3+xyzraw.z4+xyzraw.z5+xyzraw.z6)/6/200;

Xgain=sum(xyzraw.x1-Xofs)/200;
XtoY=sum(xyzraw.y1-Yofs)/200;
XtoZ=sum(xyzraw.z1-Zofs)/200;
YtoX=sum(xyzraw.x3-Xofs)/200;
Ygain=sum(xyzraw.y3-Yofs)/200;
YtoZ=sum(xyzraw.z3-Zofs)/200;
ZtoX=sum(xyzraw.x5-Xofs)/200;
ZtoY=sum(xyzraw.y5-Yofs)/200;
Zgain=sum(xyzraw.z5-Zofs)/200;

Matrix=[Xgain YtoX ZtoX;...
    XtoY Ygain ZtoY;...
    XtoZ YtoZ Zgain;...
    ];
Val_ofs=[Xofs Yofs Zofs]';

syms AccX AccY AccZ New
assume(AccX,'real');
assume(AccY,'real');
assume(AccZ,'real');
assume(New,'real')
Acc=[AccX AccY AccZ]';
invM=inv(Matrix);
New=vpa(invM*(Acc-Val_ofs),7)
