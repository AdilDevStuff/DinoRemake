extends Node2D

var canDelete = false

onready var spawnDelay = $SpawnDelay
onready var deleteDelay = $DeleteDelay
onready var spawnPos = $SpawnPos

onready var treeLog = preload("res://Scenes/TreeLog.tscn")
onready var treeLog2 = preload("res://Scenes/TreeLog2.tscn")
onready var choppedLog = preload("res://Scenes/ChoppedLog.tscn")

onready var obstaclesGroup = $"../Obstacles"

func _ready():
	pass
	
func _process(delta):
	spawnDelay.wait_time = rand_range(2,4)

func spawnObstacles():
	# Spawns Random Obstacles
	randomize()
	var obstacleInstance = [treeLog, treeLog2, choppedLog]
	var obstacle = obstacleInstance[randi() % obstacleInstance.size()]
	var obj = obstacle.instance()
	obj.global_position = spawnPos.global_position
	obstaclesGroup.add_child(obj)
	deleteDelay.start()
	yield(deleteDelay, "timeout")
	obstaclesGroup.get_child(0).queue_free()

func _on_SpawnDelay_timeout():
	spawnObstacles()
