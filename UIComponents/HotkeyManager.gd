extends Node

func _input(event):
	if event.is_action_released("Exit"):
		print("Exiting!")
		get_tree().quit()

	if event.is_action_released("TogglePlaying"):
		Events.toggle_playing.emit()

	if event.is_action_released("PlaceMarker"):
		Events.marker_selected.emit(0)
