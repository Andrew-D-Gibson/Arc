extends AudioStreamPlayer


func _ready():
	Events.toggle_playing.connect(_toggle_playing)
	


func _toggle_playing():
	stream_paused = !stream_paused
