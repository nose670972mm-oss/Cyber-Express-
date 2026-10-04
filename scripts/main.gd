extends Node2D

@export var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
var distance_to_station: float = 500.0
var coins: int = 0

func _ready() -> void:
	$SpawnTimer.timeout.connect(_on_spawn_timer_timeout)

func _process(delta: float) -> void:
	if distance_to_station > 0:
		distance_to_station -= 15.0 * delta
		$UI/DistanceLabel.text = "Estación: %d m" % max(0, int(distance_to_station))
		if distance_to_station <= 0:
			$UI/DistanceLabel.text = "¡LLEGADA A LA ESTACIÓN!"

func _on_spawn_timer_timeout() -> void:
	if distance_to_station <= 0:
		return
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(680, randf_range(40, 260))
	enemy.enemy_destroyed.connect(_on_enemy_destroyed)
	add_child(enemy)

func _on_enemy_destroyed(reward: int) -> void:
	coins += reward
	$UI/CoinsLabel.text = "Créditos: $%d" % coins
