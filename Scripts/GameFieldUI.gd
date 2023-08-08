extends Control

var score = 0

onready var distanceLabel = $Distance

func _ready():
	pass # Replace with function body.

func _process(delta):
	score += 1
	distanceLabel.text = "Score: %.0f m" % score
