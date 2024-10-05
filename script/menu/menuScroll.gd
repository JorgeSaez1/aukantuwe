extends ScrollContainer

func _ready():
	pass
	




func _on_button_pressed_familia():
	get_tree().change_scene_to_file("res://scenes/menu principal/menu.tscn")


func _on_button_pressed_cuerpo():
	get_tree().change_scene_to_file("res://scenes/menu principal/menu.tscn")
	
	
func _on_button_pressed_numeros():
	get_tree().change_scene_to_file("res://scenes/juego numeros/etapa1.tscn")
