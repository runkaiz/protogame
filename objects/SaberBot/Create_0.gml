/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = EnemyState.wander;

sprMove = SaberBotMove;

enemyScript[EnemyState.wander] = SaberBotWander;
enemyScript[EnemyState.chase] = SaberBotChase;