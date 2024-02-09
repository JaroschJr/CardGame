extends Node2D

#signal drawCard
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _score_update():
	$ScoreLabel.text = str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_playzone__score_updated():
	_score_update()
	pass # Replace with function body.
	
func _draw_card():
	var scene = load("res://card.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	#var tween = get_tree().create_tween()
	#var theHand = get_node("hand")
	#theHand._dropped_into()
	#$hand._droped_into(instance,tween)
