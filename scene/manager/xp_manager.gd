extends Node

signal xp_update(current_xp: float, target_xp: float)
signal lvl_up(new_lvl: int)
const TARGET_XP_GROWTH = 5

var current_xp = 0
var current_level = 1
var target_xp = 1


func _ready():
	GameEvents.xp_vial_collected.connect(on_xp_vial_collected)
	
	
func increment_xp(number: float):
	current_xp = min(current_xp + number, target_xp)
	xp_update.emit(current_xp, target_xp)
	if current_xp == target_xp:
		current_level += 1
		target_xp += TARGET_XP_GROWTH
		current_xp = 0
		xp_update.emit(current_xp, target_xp)
		lvl_up.emit(current_level)

func on_xp_vial_collected(number: float):
	increment_xp(number)
