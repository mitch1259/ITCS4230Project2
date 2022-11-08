/// @description Hurt opponent

if other != parent.opponent {
	exit;
}

parent.hit(damage);

instance_destroy();
