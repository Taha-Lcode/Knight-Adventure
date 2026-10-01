extends Area2D

@onready var timer: Timer = $Timer
@onready var you_died_label: Label = $CanvasLayer/YouDiedLabel

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()
	# This slows the timer the moment the player gets in contact with the Slime 
	Engine.time_scale = 0.8
	
	# This make the "CollisionShape2D" Node of the player to be removed so that the player will fall off the View.
	body.get_node("CollisionShape2D").queue_free()
	
	# This is for the label
	you_died_label.visible = true
	monitoring = false
	timer.start()

func _on_timer_timeout() -> void:
	#Engine.time_scale = 1
	get_tree().reload_current_scene()
