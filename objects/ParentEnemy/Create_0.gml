collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
state = EnemyState.idle;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
aggroCheck = 0;
aggroCheckDuration = 5;

timePassed = 0;
waitDuration = 60;
wait = 0;

sprIdle = SaberBotIdle;
sprMove = SaberBotMove;

enemyScript[EnemyState.idle] = -1;
enemyScript[EnemyState.wander] = -1;
enemyScript[EnemyState.chase] = -1;
enemyScript[EnemyState.attack] = -1;
enemyScript[EnemyState.hurt] = -1;
enemyScript[EnemyState.die] = -1;
enemyScript[EnemyState.wait] = -1;