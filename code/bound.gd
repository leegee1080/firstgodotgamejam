extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "play_character":
		body.messagefirst_queuefree()
		return
	body.queue_free()
	pass # Replace with function body.
