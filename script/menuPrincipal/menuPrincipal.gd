extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inicio_pressed():

	get_tree().change_scene_to_file("res://scenes/menuEtapas/menuEtapas.tscn")


func _on_configuracion_pressed():
	
	get_tree().change_scene_to_file("res://scenes/menuPrincipal/configuracion.tscn")


func _on_creditos_pressed():
	
	get_tree().change_scene_to_file("res://scenes/menuPrincipal/creditos.tscn")


func _on_salida_pressed():
	
	get_tree().quit()
