extends AudioStreamPlayer
onready var tween_out = get_node("Tween")

export var transition_duration = 1.00
export var transition_type = 1

func fade_out(stream_player):

	tween_out.interpolate_property(stream_player, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()


func _on_TweenOut_tween_completed(object, key):
	object.stop()
	object.volume_db = 0 
