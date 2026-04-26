extends Node

@onready var death: Button = $Death


func _ready() -> void:
	if PuzzleManager.complete_puzzles[PuzzleManager.puzzles.DEATH] == true:
		death.disabled = true

func _on_grimoire_pressed() -> void:
	if PuzzleManager.completed_puzzles == 1:
		PuzzleManager.finish_puzzle(PuzzleManager.puzzles.WORLD)
		TextManager.show_once("World_completed", [
			"ZA WARUDOOOOOOOOOOOO!"
		])
		SignalBus.world_completed.emit()
		await get_tree().create_timer(6).timeout
		SceneChanger.change_scene_to_path("res://scenes/2d/main_menu.tscn")
	else:
		TextManager.show_once("World_empty", [
			"Not yet! I need all the other cards for this spell"
		])
	
