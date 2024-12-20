extends Node2D

@export var value = 1

@onready var elias_button = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer/VBoxContainer/EliasButton
@onready var score_elias = $GUI/MarginContainer/VBoxContainer/Score
@onready var me_button = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer2/VBoxContainer/MoreElias
@onready var me_cost = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer2/VBoxContainer/MECost
@onready var me_owned = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer2/VBoxContainer/MEOwned
@onready var mario_button = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer3/VBoxContainer/MarioButton
@onready var mario_cost = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer3/VBoxContainer/MarioCost
@onready var mar_owned = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer3/VBoxContainer/MarOwned
@onready var elias_sprite = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer/VBoxContainer/EliasButton/BElias
@onready var mario_sprite = $GUI/MarginContainer/VBoxContainer/Score/MarginContainer3/VBoxContainer/MarioButton/Mario

var score = 0
var me_num = 10
var inc = 1
var mar_num = 15
var mario_i = 0
var mario_t = 0
var mario_o = 0
var sprite_t = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	elias_button.pressed.connect(_on_elias_button_pressed)
	me_button.pressed.connect(_on_me_button_pressed)
	mario_button.pressed.connect(_on_mario_button_pressed)


func _on_elias_button_pressed():
	score += inc
	elias_sprite.play("Moged")

func _on_me_button_pressed():
	if score >= me_num:
		score -= me_num
		me_num *= 2
		inc += 1

func _on_mario_button_pressed():
	if score >= mar_num:
		score -= mar_num
		mar_num *= 2
		mario_i += 10
		mario_o += 1
		mario_sprite.play("Geeked")

func _process(delta):
	score_elias.text = "Eliases: %s" % score
	me_cost.text = "Cost: %s" % me_num 
	me_owned.text = "Owned: %s" % inc
	mario_cost.text = "Cost: %s" % mar_num
	mar_owned.text = "Owned: %s" % mario_o 
	
	if sprite_t >= 7:
		sprite_t -= 7
		elias_sprite.play("Sigma")
		mario_sprite.play("Chill")
	else:
		sprite_t += .1
	
	if mario_t >= 5:
		mario_t -= 5
		score += mario_i
	else:
		mario_t += .1
