extends Node2D


@onready var tiempo = $Timer
func _ready():
	tiempo.start()
	pass

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/pantallaCarga.tscn")
	pass # Replace with function body.
