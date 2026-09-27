extends Area2D

@onready var timer: Timer = $Timer
@onready var you_died_label: Label = $CanvasLayer/YouDiedLabel

func _on_body_entered(body: Node2D) -> void:
	print("YOU DIED	") # Replace with function body.
	you_died_label.visible = true
	monitoring = false
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
