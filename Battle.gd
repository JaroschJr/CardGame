extends Node2D

#signal drawCard
# Called when the node enters the scene tree for the first time.
var score
var rng
var deck
func _ready():
	rng = RandomNumberGenerator.new()
	score = 0
	deck = []
	var p_card = load("res://PointCard.tscn")
	for i in range(5):
		var card = p_card.instantiate()
		add_child(card)
		#card.hide()
		deck.push_back(card)
		
	var d_card = load("res://DrawCard.tscn")
	for i in range(5):
		var card = d_card.instantiate()
		add_child(card)
		#card.hide()
		deck.push_back(card)
	deck.shuffle()
	
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
	
#	var r = rng.randi_range(0,1)
#	var scene
#	if r == 0:
#		scene = load("res://PointCard.tscn")
#	elif r == 1:
#		scene = load("res://DrawCard.tscn")
#	var instance = scene.instantiate()
#	add_child(instance)
	var card = deck.pop_back()
	if card :
		card.show()
		var tween = get_tree().create_tween().set_parallel(true)
		var theHand = get_node("hand")
		theHand._dropped_into(card,tween)
		#$hand._droped_into(instance,tween)
	else:
		print("deck empty")
