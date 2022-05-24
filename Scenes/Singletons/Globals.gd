extends Node

signal _player_ready
signal _player_hurt
signal _stamina_hurt
signal _player_is_dead
signal _fire
signal _no_ammo
signal moster_destroy
signal moster_stun
signal monster_spawn

# Global Player pointer variables 
var player_pos := Vector2.ZERO

#Stats
var PlayerHealth
var PlayerStamina
var PlayerAmmo

#Gamemode Variables
#var TimeLeft

var monster_counter := 10.0
var is_counting := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if is_counting:
		monster_counter -= delta
	if monster_counter <= 0:
		is_counting = false
		monster_counter = 10.0
		emit_signal("monster_spawn")


func start_monster_counter():
	is_counting = true

func stun_monster():
	emit_signal("moster_stun")

func destroy_monster():
	emit_signal("moster_destroy")

func player_dead():
	emit_signal("_player_is_dead")

func player_hurt():
	emit_signal("_player_hurt")

func stamina_hurt():
	emit_signal("_stamina_hurt")

func fire():
	emit_signal("_fire")
