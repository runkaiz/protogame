if (!isFighting) isMoving = PlayerMovement(3, self, KnightIdle, KnightRun);

if (!isMoving) isFighting = PlayerCombat(self, KnightStab);
print(isFighting);

// Listen for interrupts

if (animationInterrupt && !animationInterrupted) {
	alarm[0] = animationInterruptTime * room_speed;
	animationInterrupted = true;
}