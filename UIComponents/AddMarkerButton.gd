extends Button


func _ready():
	Events.update_ui.connect(_update)
	
	
func _on_pressed():
	Events.marker_selected.emit(0)
	
	
func _update():
	self.disabled = !Globals.is_song_loaded
