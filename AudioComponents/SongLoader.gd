extends Node

var dir = OS.get_executable_path().get_base_dir()
var python_path = dir + 'PythonFiles/arc_env/Scripts/python.exe'
var loading_script_path = dir + 'PythonFiles/test.py'


func _ready():
	if !OS.has_feature('standalone'):	# If not an exported version
		python_path = ProjectSettings.globalize_path('res://PythonFiles/arc_env/Scripts/python.exe')
		loading_script_path = ProjectSettings.globalize_path('res://PythonFiles/test.py')

	Events.load_song.connect(_load_song)


func _load_song(file_path):
	var output = []
	var err = OS.execute(python_path, [loading_script_path, file_path], output)
	print(err)
	print(output)
	
	if output[0] == 'wav':
		pass
	elif output[0] == 'mp3':
		pass
	else:
		$AcceptDialog.popup()
		return
		
	# Update the global variables
	Globals.is_song_loaded = true
	Globals.loaded_song_file_path = file_path
	Events.update_ui.emit()
