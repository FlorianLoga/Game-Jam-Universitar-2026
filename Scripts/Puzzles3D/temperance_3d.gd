extends Node

@onready var cypher_chest : InteractableObject = $StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PuzzleManager.complete_puzzles[PuzzleManager.puzzles.TEMPERANCE] == false:
		cypher_chest.interact = Callable(self, "_on_chest_clicked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_chest_clicked():
	print("lock zoomed!")
