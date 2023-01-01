extends CanvasLayer

signal start_game

func show_message():
	$TimerLabel.show()

# update score
func update_score(score):
	$ScoreLabel.text = str(score)
	
func update_timer(timer):
	$TimerLabel.text = str(timer)

func hide_timer():
	$TimerLabel.hide()
	
func show_game_over():
	$StartButton.show()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
