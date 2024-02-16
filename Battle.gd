extends Node2D

#signal drawCard
# Called when the node enters the scene tree for the first time.
var score
var rng
func _ready():
	rng = RandomNumberGenerator.new()
	score = 0
	pass # Replace with function body.

func _get_hand():
	return $hand

func _score_update():
	#$ScoreLabel.text = str(Global.score)
	$ScoreLabel.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_playzone__score_updated():
	_score_update()
	pass # Replace with function body.
	
func _draw_card():
	var r = rng.randi_range(0,1)
	var scene
	if r == 0:
		scene = load("res://PointCard.tscn")
	elif r == 1:
		scene = load("res://DrawCard.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	#var tween = get_tree().create_tween()
	#var theHand = get_node("hand")
	#theHand._dropped_into()
	#$hand._droped_into(instance,tween)
