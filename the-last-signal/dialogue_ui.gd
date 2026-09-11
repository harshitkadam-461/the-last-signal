extends CanvasLayer

signal dialogue_finished

@onready var speaker = $Panel/Speaker
@onready var text = $Panel/Text

var lines: Array = []
var index := 0

func _ready():
	visible = true
	play_dialogue(StoryData.cutscene_drive)

func play_dialogue(data: Array) -> void:
	lines = data
	index = 0
	visible = true
	show_line()

func show_line() -> void:
	var entry = lines[index]
	speaker.text = entry["speaker"]
	text.text = entry["line"]

func _input(event):
	if visible and event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			index += 1
			if index >= lines.size():
				visible = false
				dialogue_finished.emit()
			else:
				show_line()
