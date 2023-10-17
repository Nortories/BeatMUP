extends CanvasLayer

@export var xp_manager: Node
@onready var progress_bar = $MarginContainer/ProgressBar


func _ready():
	progress_bar.value = 0
	xp_manager.xp_update.connect(on_xp_update)
	

func on_xp_update(current_xp: float, target_xp: float):
	var percent = current_xp / target_xp
	progress_bar.value = percent
