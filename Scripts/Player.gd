extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite

var isInCombo = false
var timeTillNextInput = 0.7
var time = 0

var currentAttack = 0
var previousAttack = 0

func _ready():
	time = timeTillNextInput
	pass
	
func _process(delta):
	if(Input.is_action_just_pressed("input_1")):
		if(currentAttack == 0):
			animatedSprite.play("foot hit")
		elif(currentAttack == 1):
			animatedSprite.play("arm hit")
			
		currentAttack += 1
		isInCombo = true
		
	if(isInCombo):
		time -= delta
		
		if(time < 0):
			isInCombo = false
			currentAttack = 0
			animatedSprite.play("idle")
		
	pass

func _Reset_Attack_Timer():
	if(currentAttack < 2):
		time = timeTillNextInput
#
#onready var timer = get_parent().get_node("Timer")
#onready var sprite = $AnimatedSprite
#
#const UP_DIRECTION := Vector2.UP
#
#export var speed := 600.0
#export var maximum_jumps := 2
#export var jump_strength := 1500.0
#export var double_jump_strength := 1200.0
#export var gravity := 4500.0
#export var is_anim_played := false
#
#var _jumps_count := 0
#var _velocity := Vector2.ZERO
#
#func _start_timer(sec: int):
#	timer.start(sec)
#
#func _on_timeout():
#	if sprite.animation == "arm hit":
#		sprite.play("defualt")
#	elif sprite.animation == "foot hit":
#		sprite.play("defualt")
#
#func _physics_process(delta) -> void:
#	var origin_flip = get_node( "AnimatedSprite").flip_h
#	var _horizon_direction = (
#		Input.get_action_strength("move_right") -
#		Input.get_action_strength("move_left")
#	)
#
#	if _horizon_direction > 0 :
#		if is_on_floor():
#			get_node("AnimatedSprite").play("running")
#		else:
#			get_node("AnimatedSprite").play("jump")
#		get_node( "AnimatedSprite").set_flip_h(false)
#	elif _horizon_direction == 0:
#		get_node( "AnimatedSprite").set_flip_h(origin_flip)
#		if is_on_floor():
#			if Input.is_action_pressed("input_1"):
#				is_anim_played = true
#				sprite.play("arm hit")
#				_start_timer(5/14)
#			elif Input.is_action_pressed("input_2"):
#				is_anim_played = true
#				sprite.play("foot hit")
#				_start_timer(5/14)
#			else:
#				if (not is_anim_played):
#					get_node("AnimatedSprite").play("default")
#		else:
#			get_node("AnimatedSprite").play("jump")
#	else:
#		if is_on_floor():
#			get_node("AnimatedSprite").play("running")
#		else:
#			get_node("AnimatedSprite").play("jump")
#		get_node( "AnimatedSprite").set_flip_h(true)
#
#	_velocity.x = _horizon_direction * speed
#	_velocity.y += gravity * delta
#
#	var is_falling := _velocity.y > 0 and not is_on_floor()
#	var is_jumping := Input.is_action_just_pressed("jump") and is_on_floor()
#	var is_jump_cancelled := Input.is_action_just_released("jump") and _velocity.y < 0
#	var is_double_jumping := Input.is_action_just_pressed("jump") and is_falling
#	var is_idle := is_on_floor() and is_zero_approx(_velocity.x)
#	var is_running := is_on_floor() and not is_zero_approx(_velocity.x)
#
#	if is_falling or is_jumping:
#		get_node("AnimatedSprite").play("jump")
#
#	if is_jumping:
#		_jumps_count += 1
#		_velocity.y -= jump_strength
#	elif is_double_jumping:
#		_jumps_count += 1
#		if _jumps_count <= maximum_jumps:
#			_velocity.y -= double_jump_strength
#
#	_velocity = move_and_slide(_velocity, UP_DIRECTION)
#
#	pass
## Called when the node enters the scene tree for the first time.
#func _ready():
#
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#
#
#func _on_Timer_timeout():
#	print("timeout")
#	if sprite.animation == "arm hit":
#		is_anim_played = false
#		sprite.play("defualt")
#	elif sprite.animation == "foot hit":
#		is_anim_played = false
#		sprite.play("defualt")
#	pass # Replace with function body.
