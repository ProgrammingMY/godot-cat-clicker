extends CanvasLayer

var score
var timer
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Cat.hide()
	screen_size = get_viewport().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func new_game():
	# reset the score
	score = 0
	timer = 10
	
	$Cat.show()
	$HUD.update_timer(timer)
	$HUD.show_message()
	$GameTimer.start()
	$HUD.update_score(score)
	
func game_over():
	$HUD.hide_timer()
	$Cat.hide()
	$HUD.show_game_over()

func _on_Cat_pressed():
	# get score in each click
	score += 1
	$HUD.update_score(score)
	
	# update positon of cat
	var boundary = Vector2($Cat.rect_size.x, $Cat.rect_size.y)
	var new_position = Vector2(randi()%int(screen_size.x - boundary.x), randi()%int(screen_size.y - boundary.y))
	get_node("Cat").set_position(Vector2(new_position.x, new_position.y))


func _on_GameTimer_timeout():
	timer -= 1
	$HUD.update_timer(timer)
	
	if (timer <= 0):
		game_over()
