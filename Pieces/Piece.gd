extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2.ZERO

var Effects = null
var dying = false
var wiggle = 0.0
export var wiggle_amount = 3

export var transparent_time = 1.0
export var scale_time = 1.5
export var rot_time = 1.5

var s1 = null
var s2 = null
var s3 = null

var Coin = preload("res://Coin.tscn")

func _ready():
	$Select.texture = $Sprite.texture
	$Select.scale = $Sprite.scale

func _physics_process(_delta):
	if dying:
		queue_free()
	elif position != target_position:
		position = target_position
	if selected:
		$Select.show()
		$Selected.emitting = true
	else:
		$Select.hide()
		$Selected.emitting = false

func generate(pos):
	position = Vector2(pos.x,-100)
	target_position = pos
	if s1 == null:
		s1=get_node_or_null("/root/Game/1")
	if s1 !=null:
		s1.play()

func move_piece(change):
	target_position = target_position + change
	if s2 == null:
		s2=get_node_or_null("/root/Game/2")
	if s2 !=null:
		s2.play()
func die():
	dying = true;
	if s3 == null:
		s3=get_node_or_null("/root/Game/3")
	if s3 !=null:
		s3.play()
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var coin = Coin.instance()
		coin.position = target_position
		Effects.add_child(coin)
