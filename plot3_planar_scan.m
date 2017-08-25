clear all
close all
clc

name = 'simulation_1/scan_1.txt';

for sca = 1:1
    
%     s = load('simulation_1/scan_1.txt');
    s = load(name);
    name(19) = name(19)+1;

    first_scan = 1;
    last_scan = size(s, 1);

    upper_margin = 0.1;
    lower_margin = -0.6;


    number_of_points =  size(s(1,8:size(s,2)),2)/2;


    counter=1;
    for j=first_scan:1:last_scan

        p = reshape( s(j,8:size(s,2)) , 2, number_of_points);
    %     p = p(:,norm(p(:,))>0.1);

        p(3,:) = zeros(1,size(p,2));

        %plot3(p(1,:), p(2,:), p(3,:), '.b')
        grid on

        R = rpy2rot(pi/2, -pi/2, s(j,6));
        
        q = zeros(size(p));

        for i = 1:size(p,2)
            if norm(p(:,i))<9.95 && norm(p(:,i))>0.3
                q(:,i) = R*p(:,i) + s(j,1:3)';
            else
                q(:,i) = [0 0 0]';
            end
            if norm(p(:,i))>0.3
                r(:,counter) = R*p(:,i);
                if r(3,counter)>upper_margin | r(3,counter)<lower_margin 
                    r(:,counter) = []';
                else
                    counter = counter+1;
                end
    %         else
    %             r(:,i+size(p,2)*(j+first_scan)) = [0 0 0]';
            end
        end



        for i = size(p,2):-1:1
            if norm(q(:,i))==0
                q(:,i) = [];
            end
        end



        ind_not_obstacles = q(3,:)-s(1,3)>upper_margin | q(3,:)-s(1,3)<lower_margin;
        ind_obstacles = (ind_not_obstacles==0);

        hold on
        plot3(q(1,ind_not_obstacles), q(2,ind_not_obstacles), q(3,ind_not_obstacles), '.g')
        plot3(q(1,ind_obstacles), q(2,ind_obstacles), q(3,ind_obstacles), '.r')
        %axis([-10 10 -6 6 -5 5])
        axis equal
        grid on
%         pause(0.001)
    end
    sca
end








%% decomment everything below to have more plots (i.e., of r)%

plot3UAV(s(1,1:3), [0.6, 0.6, 0.2])

figure % plot the r points
plot3(r(1,:), r(2,:), r(3,:), '.b')
axis equal
grid on


step = 1;
% recreate a 360 deg scan
at2 = atan2(r(2,:), r(1,:));
nor = sqrt(r(2,:).^2 + r(1,:).^2);

for j=1:step:360
    
    
    if sum((at2>(j-181)*pi/180 & at2<(j-181+step)*pi/180))>0
        minorm((j+step-1)/step) = min(nor(at2>(j-181)*pi/180 & at2<(j-181+step)*pi/180));
    else
        minorm((j+step-1)/step) = 0;
    end
    
    angle = (j-180)*pi/180;
    
    sc(:,(j+step-1)/step) = [cos(angle)*minorm((j+step-1)/step) sin(angle)*minorm((j+step-1)/step)]';
    
    pause(0.01)
end

figure
plot(sc(1,:), sc(2,:), '.')
axis equal
grid on



savefile = fopen('mapscan.txt',  'w');
fprintf(savefile, '%f ', sc);

savefile = fopen('mapscan_polar.txt',  'w');
fprintf(savefile, '%d %f %f ', 360/step, -pi, pi);
fprintf(savefile, '%f ', minorm);




