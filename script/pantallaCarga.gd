extends Node2D


func _ready():
	var contador = 20;
	while (contador < 100):
		$ProgressBar.value = contador
		contador += contador
		await get_tree().create_timer(1.3).timeout;
	get_tree().change_scene_to_file("res://scenes/menu principal/menu.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
