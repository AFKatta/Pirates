function MACROS() {
	// ><
#macro FRAME_RATE 60
#macro TILE_SIZE 48
#macro CARDINAL_DIR round(direction/90)
#macro FRAME_SIZE 64
#macro ROOM_START room_Beach

#macro RESOLUTION_W 1366 
#macro RESOLUTION_H 768

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

	enum ENEMYSTATE
	{
		IDLE,
		WANDER,
		CHASE,
		ATTACK,
		HURT,
		DIE,
		WAIT
	}

}
