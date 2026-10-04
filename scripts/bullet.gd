extends Area2D

@export var speed: float = 700.0
@export var damage: int = 25
var direction: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		queue_free()

func _on_screen_exited() -> void:
	queue_free()
