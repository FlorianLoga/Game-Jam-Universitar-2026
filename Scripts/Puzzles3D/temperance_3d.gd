extends Node

@onready var cypher_chest : InteractableObject = $StaticBody3D
@export var zoom_camera : Camera3D 
@export var player : CharacterBody3D
@export var actual_chest : Node3D
@export var static_chest : StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PuzzleManager.complete_puzzles[PuzzleManager.puzzles.TEMPERANCE] == false:
		cypher_chest.interact = Callable(self, "_on_chest_clicked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_chest_clicked():
	print("lock zoomed!")
	if zoom_camera:
		zoom_camera.make_current()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		zoom_camera.canvas.visible = true


func _on_zoom_camera_cypher_cracked() -> void:
	SignalBus.temperance_completed.emit()
	PuzzleManager.chest_opened = true
	print("opening chest!")
	
	static_chest.remove_from_group("Interactables")
	zoom_camera.queue_free()
	player.camera.make_current()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	await get_tree().create_timer(1).timeout
	actual_chest.open_chest()
	
