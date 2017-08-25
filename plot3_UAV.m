function plot3_UAV(origin, size, armcolor, legcolor)

    if nargin < 3
       armcolor = 'b';
    end
    if nargin < 4
       legcolor = 'k';
    end

    plot3_cuboid(origin, [size(1), 0.03, 0.03], armcolor, armcolor);

    plot3_cuboid(origin, [0.03, size(2), 0.03], armcolor, armcolor);

    plot3_cuboid(origin+[ 0.99*size(1)/2-0.01  0                    -size(3)/2], [0.01, 0.01, size(3)], legcolor, legcolor);
    plot3_cuboid(origin+[-0.99*size(1)/2+0.01  0                    -size(3)/2], [0.01, 0.01, size(3)], legcolor, legcolor);
    plot3_cuboid(origin+[ 0                    0.99*size(2)/2-0.01  -size(3)/2], [0.01, 0.01, size(3)], legcolor, legcolor);
    plot3_cuboid(origin+[ 0.                  -0.99*size(2)/2+0.01  -size(3)/2], [0.01, 0.01, size(3)], legcolor, legcolor);
    
end
