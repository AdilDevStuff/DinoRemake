extends Control

onready var gameFieldUI = $"../../GameUI/GameFieldUI"
onready var distance = $Distance

func _ready():
	visible = false

func _process(delta):
	var score = gameFieldUI.score
	distance.text = "Score: %.0f m" % score
	
	if Input.is_action_just_pressed("ui_accept") and visible:
		get_tree().reload_current_scene()
