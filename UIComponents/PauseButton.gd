extends Button


func _ready():
	Events.update_ui.connect(_update)
	
	
func _on_pressed():
	Events.toggle_playing.emit()
	
	
func _update():
	self.disabled = !Globals.is_song_loaded
	set_text("Pause" if Globals.playing else "Play")
