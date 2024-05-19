extends ScrollContainer

@export var card_scale: float = 1
@export var card_current_scale: float = 1.3
@export var scroll_duration: float = 1.3	

var card_current_index: int = 0
var card_x_positions: Array = []

@onready var scroll_tween: Tween = $TweenNode.create_tween()
var margin_r: int = 0
var card_space: int = 0
var card_nodes: Array = []

func _ready() -> void:
	if is_instance_valid($CenterContainer/MarginContainer):
		margin_r = $CenterContainer/MarginContainer.get("theme_override_constants/margin_right")
		card_space = $CenterContainer/MarginContainer/HBoxContainer.get("theme_override_constants/separation")
		card_nodes = $CenterContainer/MarginContainer/HBoxContainer.get_children()
		
		for _card in card_nodes:
			var _card_pos_x: float = (margin_r + _card.position.x) - ((size.x - _card.size.x) / 2)
			_card.pivot_offset = (_card.size / 2)
			card_x_positions.append(_card_pos_x)
			
		scroll_horizontal = card_x_positions[card_current_index]
		scroll()

func _process(delta: float) -> void:
	for _index in range(card_x_positions.size()):
		var _card_pos_x: float = card_x_positions[_index]
		var _swipe_length: float = (card_nodes[_index].size.x / 2) + (card_space / 2)
		var _swipe_current_length: float = abs(_card_pos_x - scroll_horizontal)
		var _card_scale: float = remap(_swipe_current_length, _swipe_length, 0, card_scale, card_current_scale)
		var _card_opacity: float = remap(_swipe_current_length, _swipe_length, 0, 0.3, 1)
		
		_card_scale = clamp(_card_scale, card_scale, card_current_scale)
		_card_opacity = clamp(_card_opacity, 0.3, 1)
		
		card_nodes[_index].scale = Vector2(_card_scale, _card_scale)
		card_nodes[_index].modulate.a = _card_opacity
		
		if _swipe_current_length < _swipe_length:
			card_current_index = _index

func scroll() -> void:
	for _index in range(card_nodes.size()):
		var _card_scale: float = card_current_scale if _index == card_current_index else card_scale
		scroll_tween.interpolate_property(
			card_nodes[_index],
			"scale",
			card_nodes[_index].scale,
			Vector2(_card_scale, _card_scale),
			scroll_duration,
			Tween.TRANS_QUAD,
			Tween.EASE_OUT)
		
	scroll_tween.start()

func _on_ScrollContainer_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			scroll_tween.stop_all()
		else:
			scroll()

