extends Camera3D

var is_following
var target_node: CharacterBody3D

@export var Lerp_Speed: float
@export var Home_Node: Node3D

var home_pos

func _ready():
	home_pos = self.position

func start_follow(node):
	is_following = true
	target_node = node

func stop_follow():
	is_following = false
	
func go_home():
	is_following = false
	self.position = home_pos

func _process(delta):
	if is_following and target_node != null:
		# Get the current position of the camera and the target node
		var current_pos = position
		var target_pos = target_node.position

		# Lerp the camera's position towards the target node's position
		current_pos.x = lerp(current_pos.x, target_pos.x + (target_node.velocity.x/1), Lerp_Speed * delta)
		current_pos.y = lerp(current_pos.y, target_pos.y + (target_node.velocity.y/3) + 4, Lerp_Speed * delta)

		# Update the camera's position
		position = current_pos
