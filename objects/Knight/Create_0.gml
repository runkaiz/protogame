animationInterrupted = false;
animationInterrupt = false;
animationInterruptTime = 0;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

disableMovement = false;
disableCombat = false;

xVel = 0;
yVel = 0;

if instance_exists(inst_6090D6BB) {
	inst_6090D6BB.player = self;
} else {
	print("Man you should stop trolling, NOW");	
}