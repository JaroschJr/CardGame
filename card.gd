extends Node2D

class_name card

var draggable = false
var is_inside_dropable = false
var body_ref
var initialPos : Vector2
var battleRef


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$Art.z_index = 1
	battleRef = get_node("/root/Battle")
	body_ref = get_node("/root/Battle/Pile")
	var tween = get_tree().create_tween().set_parallel(true)
	#body_ref._dropped_into(self,tween)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable && (Global.held == null || Global.held == self):
		if Input.is_action_just_pressed("click"):
			Global.isDragging = true
			Global.held = self
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.isDragging = false
			Global.held = null
			var tween = get_tree().create_tween().set_parallel(true)
			if is_inside_dropable:
				body_ref._dropped_into(self,tween)
				#initialPos = body_ref.position
				#tween.tween_property(self, "position" ,body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				#tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_mouse_entered():
	if not Global.isDragging:
		draggable = true
		scale = Vector2(1.1,1.1)


func _on_area_2d_mouse_exited():
	if not Global.isDragging:
		draggable = false
		scale = Vector2(1,1)


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.GOLDENROD, 1)
		body_ref = body


func _on_area_2d_body_exited(body):
	is_inside_dropable = false
	body.modulate = body.defColor
	
#func _on_play():
#	battleRef.score = battleRef.score + 1
