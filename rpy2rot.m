% roll pitch and yaw to rotation matrix
function R = rpy2rot(r, p, y)

    Rx = [1     0       0
          0 cos(r) -sin(r)
          0 sin(r)  cos(r)];

     Ry = [ cos(p) 0  sin(p)
                0  1      0
           -sin(p) 0  cos(p)];


     Rz = [cos(y) -sin(y) 0
           sin(y)  cos(y) 0
               0       0  1];

     R = Rz*Ry*Rx;
     
end


