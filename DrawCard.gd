extends card


func _on_play():
	super._on_play()
	battleRef._get_hand().cards.erase(self)
	battleRef._draw_card()
	self.queue_free()
