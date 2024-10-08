extends Node2D
@export var next_scene: String = "res://scenes/menu etapas/menuEtapas.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureButton.pressed.connect(_on_texture_button_pressed_salida)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed_salida() -> void:
	var next_sceneloaded = ResourceLoader.load(next_scene)
	if next_sceneloaded:
		get_tree().change_scene_to_file("res://scenes/menu etapas/menuEtapas.tscn")
	else:
		print("Error: No se pudo cargar la escena")
	pass # Replace with function body.
