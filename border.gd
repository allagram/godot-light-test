extends StaticBody2D

export(int) var tin = 0
export(int) var tout = 0
var thalf
var win = OS.get_window_size()
var shape
var shapeowner

func _ready():
	thalf = (tin + tout) /2
	for extpos in [
			[Vector2(thalf, win.y/2), Vector2(tin - thalf, win.y/2)],  #left
			[Vector2(thalf, win.y/2), Vector2(win.x + thalf - tin, win.y/2)],  #right
			[Vector2(win.x/2, thalf), Vector2(win.x/2, tin - thalf)],  #top
			[Vector2(win.x/2, thalf), Vector2(win.x/2, win.y + thalf - tin)],  #bottom
			]:
		shape = RectangleShape2D.new()
		shape.extents = extpos[0]
		shapeowner = create_shape_owner(self)
		shape_owner_set_transform(shapeowner, Transform2D(0, extpos[1]))
		shape_owner_add_shape(shapeowner, shape)