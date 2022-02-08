animationInterrupted = false;
animationInterrupt = false;
animationInterruptTime = 0;

disableMovement = false;
disableCombat = false;

if instance_exists(inst_6090D6BB) {
	inst_6090D6BB.player = self;
} else {
	print("Man you should stop trolling, NOW");	
}