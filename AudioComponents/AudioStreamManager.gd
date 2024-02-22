extends AudioStreamPlayer


func _ready():
	Events.update_ui.connect(_update_playing)
	

func _update_playing():
	stream_paused = !stream_paused
