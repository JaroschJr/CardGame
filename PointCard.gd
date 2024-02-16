extends card

func _on_play():
	battleRef._get_hand().cards.erase(self)
	var tween = get_tree().create_tween().set_parallel(true)
	battleRef._get_hand()._card_spread(tween)
	battleRef.score = battleRef.score + 1
	self.queue_free()
