extends Button

@export var audio: AudioStreamPlayer


func _ready():
	Events.toggle_playing.connect(_update_text)
	
	
func _on_pressed():
	Events.toggle_playing.emit()
	
	
func _update_text():
	set_text("Play" if audio.stream_paused else "Pause")
	



