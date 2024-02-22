extends Node

# Constants
# e.g. const SONG_TIME = 3

# Variables
# e.g. var current_playtime = 1.2
var is_song_loaded = false
var loaded_song_file_path = ''
var playing = true


func _ready():
	Events.toggle_playing.connect(_on_toggle_playing)
	

func _on_toggle_playing():
	# Don't toggle playing a song if one isn't loaded
	if !Globals.is_song_loaded:
		return
		
	Globals.playing = !Globals.playing
	Events.update_ui.emit()
