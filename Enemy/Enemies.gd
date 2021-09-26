extends Node2D

var positions = [
	Vector2(100,-50)
	,Vector2(912,-50)
]

var Enemy = preload("res://Enemy/Enemy.tscn")
var Boss = preload("res://Enemy/Boss.tscn")
var num_enemies = 2
var respawning = false

func _ready():
	randomize()

func _physics_process(_delta):
	if (get_child_count()-1 < num_enemies) and (!respawning):
		$Respawn.start()
		respawning = true

func add_enemy():
	var enemy = Enemy.instance()
	enemy.position = positions[randi() % positions.size()] + Vector2(randf()*100, randf()*100).rotated(randf()*2*PI)
	add_child(enemy)
	var enemy2 = Enemy.instance()
	enemy2.position = positions[randi() % positions.size()] + Vector2(randf()*100, randf()*100).rotated(randf()*2*PI)
	add_child(enemy2)
	num_enemies = 1 + floor(Global.score / 1000)

func _on_Respawn_timeout():
	add_enemy()
	respawning = false
