extends StaticBody2D

# Called when the node enters the scene tree for the first time.var cards = Array()

var defColor = Color(Color.MEDIUM_PURPLE, 0.5)
var leftEnd
var rightEnd
var cards = Array()
func _ready():
	##leftEnd = $CardLayLine.get_point_position(0)
	##rightEnd = $CardLayLine.get_point_position(1)
	leftEnd = Vector2(256,576)
	rightEnd = Vector2(832,576)
	
	
	cards = Array()
	modulate = defColor

func _dropped_into(card, tween):
	print(leftEnd)
	print(rightEnd)
	if cards.has(card) == false:
		cards.append(card)
	var interval = leftEnd.distance_to(rightEnd)
	print(str(interval))
	interval = interval/ (1+cards.size())
	print(str(interval))
	
	for x in cards.size():
		var tempCard = cards[x]
		#print(self.position)
		var pos = leftEnd.x + interval * (x+1)
		tempCard.initialPos = Vector2(pos, leftEnd.y)
		print(str(tempCard.initialPos))
		tween.tween_property(tempCard, "position" ,tempCard.initialPos,0.2).set_ease(Tween.EASE_OUT)
	
	pass
	
#func _insert_card(card)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.isDragging:
		visible = true
	else:
		visible = false
