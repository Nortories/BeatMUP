extends PanelContainer

signal selected

@onready var name_lable: Label = $%NameLabel
@onready var discription_lable: Label = $%DescriptionLable


func _ready():
	gui_input.connect(on_gui_input)


func set_ability_upgrade(upgrade: AbilityUpgrade):
	name_lable.text = upgrade.name
	discription_lable.text = upgrade.description


func on_gui_input(event: InputEvent):
	if event.is_action_pressed("left_click"):
		selected.emit()
