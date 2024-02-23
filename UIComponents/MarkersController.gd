extends VBoxContainer

func disable():
	$PanelContainer/MarginContainer/VBoxContainer/TimeEntry/LineEdit.editable = false
	$PanelContainer/MarginContainer/VBoxContainer/TerminalNumberEntry/SpinBox.editable = false
	$PanelContainer/MarginContainer/VBoxContainer/FireworkTypeButton.disabled = true
	$PanelContainer/MarginContainer/VBoxContainer/SyncTypeButton.disabled = true
	
func enable(marker_num):
	if !Globals.is_song_loaded:
		return
		
	$PanelContainer/MarginContainer/VBoxContainer/TimeEntry/LineEdit.editable = true
	$PanelContainer/MarginContainer/VBoxContainer/TerminalNumberEntry/SpinBox.editable = true
	$PanelContainer/MarginContainer/VBoxContainer/FireworkTypeButton.disabled = false
	$PanelContainer/MarginContainer/VBoxContainer/SyncTypeButton.disabled = false
	

func _ready():
	Events.marker_selected.connect(enable)
	Events.marker_deselected.connect(disable)
	disable()
