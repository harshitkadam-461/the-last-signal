extends CharacterBody3D


enum State { PATROL, INVESTIGATE, CHASE }
var state = State.PATROL
var waypoints:Array = []
var wp_index := 0
const PATROL_SPEED = 2.0

func _physics_process(delta):
  if state == State.PATROL:
	patrol()
	
func patrol():
	  if waypoints.is_empty(): return
	  var target = waypoints[wp_index]
	  var dir = target - global_transform.origin
	  dir.y = 0
	  if dir.length() < 0.5:
		wp_index = (wp_index + 1) % waypoints.size()
	  else:
		velocity = dir.normalized() * PATROL_SPEED
		move_and_slide()
		
