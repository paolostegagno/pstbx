% plot3_cube    plot a 3D cuboid in a 3D figure
%  plot a cube in a 3D figure
%  plot(origin, size, color_faces, color_edges)   plot a cube in the
%  specified origin (3x1 vector), with the specified size (3x1 vector) with
%  specified colors for faces and edges.
function plot3_cuboid ( origin, size, color_faces, color_edges)

    x=([0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0]-0.5)*size(1)+origin(1);
    y=([0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1]-0.5)*size(2)+origin(2);
    z=([0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1]-0.5)*size(3)+origin(3);
    for i=1:6
        h=patch(x(:,i),y(:,i),z(:,i),color_faces);
        set(h,'edgecolor',color_edges)
    end

end