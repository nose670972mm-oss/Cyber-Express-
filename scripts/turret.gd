extends Node2D

@export var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
@export var fire_rate: float = 0.12
var can_shoot: bool = true

func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func shoot() -> void:
	can_shoot = false
	var bullet = bullet_scene.instantiate()
	bullet.global_position = $Muzzle.global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	bullet.rotation = bullet.direction.angle()
	get_tree().current_scene.add_child(bullet)

	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
