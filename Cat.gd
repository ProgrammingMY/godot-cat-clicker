extends TextureButton

var screen_size = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_position.x = clamp(rect_position.x, 0, screen_size.x)
	rect_position.y = clamp(rect_position.y, 0, screen_size.y)
