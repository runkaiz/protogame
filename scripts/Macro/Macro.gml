#macro TILE_SIZE 16

enum EnemyState {
	idle,
	wander,
	chase,
	attack,
	hurt,
	die,
	wait
}