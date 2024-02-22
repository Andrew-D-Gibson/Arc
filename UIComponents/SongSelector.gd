extends HBoxContainer


func _ready():
	Events.update_ui.connect(_update)
	

func _on_button_button_down():
	$FileDialog.popup()
	

func _on_file_dialog_file_selected(file_path):
	Events.load_song.emit(file_path)
	

func _update():
	if Globals.loaded_song_file_path != '':
		$Label.set_text(Globals.loaded_song_file_path)
