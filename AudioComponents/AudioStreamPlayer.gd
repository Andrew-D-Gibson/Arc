extends AudioStreamPlayer

func _ready():
	Events.update_ui.connect(_update)
	Events.toggle_playing.connect(_on_toggle_playing)


func load_mp3(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound


func _update():
	if Globals.is_song_loaded and get_stream() == null:
		var song = load_mp3(Globals.loaded_song_file_path)

		set_stream(song)
		play()
		Globals.playing = true
		
		
func _on_toggle_playing():
	if get_stream() != null:
		stream_paused = !stream_paused
		Globals.playing = stream_paused
		Events.update_ui.emit()
	
