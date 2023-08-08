extends KinematicBody2D

export (float) var jumpForce
export (float) var gravity

var velocity := Vector2.ZERO

onready var gameOverUI = $"../GameOverScreen/GameOverUI"
onready var ground = $"../Floor/Ground"

func _ready():
	get_tree().paused = false
	ground.material.set("shader_param/speed", 0.25)

func _process(delta):
	pass

func _physics_process(delta):
	movement()

func movement():
	if not is_on_floor():
		velocity.y += gravity
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jumpForce
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Collision_area_entered(area):
	if area.is_in_group("Enemy"):
		gameOverUI.visible = true
		ground.material.set("shader_param/speed", 0)
		get_tree().paused = true
