extends Node2D

@export var max_hp: int = 100
var current_hp: int

func _ready() -> void:
	current_hp = max_hp

func take_damage(amount: int) -> void:
	current_hp -= amount
	print("Salud del Tren: ", current_hp)
	if current_hp <= 0:
		print("¡El tren ha sido destruido!")
