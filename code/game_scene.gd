extends Node3D

var plat_height_max
var plat_height_min

@export var plat_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	plat_height_max = get_meta("PLAT_HEIGHT_MAX")
	plat_height_min = get_meta("PLAT_HEIGHT_MIN")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var new_plat = plat_scene.instantiate()
	new_plat.set_name("Platform")
	
	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var plat_spawn_location = get_node("EnviornmentObjects/SpawnPath/SpawnLocation")
	# And give it a random offset.
	plat_spawn_location.progress_ratio = randf()
	
	new_plat.initialize(plat_spawn_location.position)
	
	get_node("Platforms").add_child(new_plat)
	
	pass # Replace with function body.
