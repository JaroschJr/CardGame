extends card

func _on_play():
	battleRef._get_hand().cards.erase(self)
	battleRef.score = battleRef.score + 1
	self.queue_free()
