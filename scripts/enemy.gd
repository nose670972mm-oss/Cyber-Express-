extends Area2D

@export var speed: float = 140.0
@export var hp: int = 50
@export var reward: int = 20

signal enemy_destroyed(reward_amount)

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -40:
		queue_free()

func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		enemy_destroyed.emit(reward)
		queue_free()
