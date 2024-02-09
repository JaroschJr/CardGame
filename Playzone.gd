extends StaticBody2D

signal _score_updated

var defColor = Color(Color.CYAN, 0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = defColor

func _dropped_into(card, tween):
	card.initialPos = self.position
	tween.tween_property(card, "position" ,self.position,0.2).set_ease(Tween.EASE_OUT)
	Global.score = Global.score + 1
	_score_updated.emit()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.isDragging:
		visible = true
	else:
		visible = false
