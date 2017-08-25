% conversion between roll, pitch and yaw angles in quaternion [x y z w]
function q = rpy2quat(r, p, y)
	cy = cos(y * 0.5);
	sy = sin(y * 0.5);
	cr = cos(r * 0.5);
	sr = sin(r * 0.5);
	cp = cos(p * 0.5);
	sp = sin(p * 0.5);

	%x
    q(1) = cy * sr * cp - sy * cr * sp;
	%y
    q(2) = cy * cr * sp + sy * sr * cp;
	%z
    q(3) = sy * cr * cp - cy * sr * sp;
    %w
	q(4) = cy * cr * cp + sy * sr * sp;
    
end
