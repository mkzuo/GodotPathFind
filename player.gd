
extends RigidBody2D

# travel speed in pixel/s
export var speed = 200

# at which distance to stop moving
# NOTE: setting this value too low might result in jerky movement near destination
const eps = 1.5

# points in the path
var points = []




func _physics_process(delta):
	
	if Input.is_action_just_released("Fire"):
		# refresh the points in the path
		var t = OS.get_ticks_usec()
		points = get_node("../Navigation2D").get_simple_path(global_position, get_global_mouse_position(), false)
		print("usec : ", OS.get_ticks_usec() - t )
		# if the path has more than one point
		if points.size() > 1:
			update() # we update the node so it has to draw it self again
		else:
			print("No Points")

func _draw():
	# if there are points to draw
	if points.size() > 1:
		for p in points:
			draw_circle(p - global_position, 8, Color(1, 0, 0)) # we draw a circle (convert to global position first)