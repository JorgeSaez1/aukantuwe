extends Node2D
var Touch = false
@export var next_scene: String = "res://scenes/menu etapas/menuEtapas.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$inicio.pressed.connect(_on_inicio_pressed)
	$salida.pressed.connect(_on_salida_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_inicio_pressed():	
	var next_sceneloaded = ResourceLoader.load(next_scene)
	if next_sceneloaded:
		get_tree().change_scene_to_file("res://scenes/menu etapas/menuEtapas.tscn")
	else:
		print("Error: No se pudo cargar la escena")


func _on_configuracion_pressed():
	
	get_tree().change_scene_to_file("res://scenes/menu principal/configuracion.tscn")


func _on_creditos_pressed():
	
	get_tree().change_scene_to_file("res://scenes/menu principal/creditos.tscn")


func _on_salida_pressed():
	var next_sceneloaded = ResourceLoader.load(next_scene)
	if next_sceneloaded:
		get_tree().quit()
