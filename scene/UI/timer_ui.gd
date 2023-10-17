extends CanvasLayer


@export var game_time_manager: Node
@onready var label = $%Label


func _process(delta):
	if game_time_manager == null:
		return
	var time_elapsed = game_time_manager.get_time_elapsed()
	label.text = format_seconds_to_string(time_elapsed)


func format_seconds_to_string(seconds:float):
		var minute = floor(seconds / 60)
		var remaining = seconds - (minute * 60)
		return str(minute) + ":" + ("%02d" % floor(remaining))
