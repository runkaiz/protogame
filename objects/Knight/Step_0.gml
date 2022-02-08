if (!disableMovement) disableCombat = PlayerMovement(3, self, KnightIdle, KnightRun);

if (!disableCombat) disableMovement = PlayerCombat(self, KnightStab, KnightShield);

// Listen for interrupts

if (animationInterrupt && !animationInterrupted) {
	alarm[0] = animationInterruptTime * room_speed;
	animationInterrupted = true;
}