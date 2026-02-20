extends Node

# Skrip manajer Level 2: menangani fitur reset level.
# Level akan di-reset dalam dua kondisi:
#   1. Otomatis, ketika pesawat (GreenShip) keluar dari batas layar (dianggap gagal).
#   2. Manual, ketika pemain menekan tombol R.

@onready var ship: RigidBody2D = $GreenShip

# Jarak tambahan di luar layar sebelum reset terpicu, agar reset baru
# aktif setelah pesawat benar-benar keluar dari area permainan.
const SCREEN_MARGIN := 100.0

# Penanda agar reset tidak terpanggil berkali-kali dalam satu frame.
var _resetting := false

func _process(_delta):
	if ship == null:
		return

	var screen_size := get_viewport().get_visible_rect().size
	var pos := ship.global_position

	# Pesawat dianggap gagal jika sudah keluar layar di sisi manapun.
	var keluar_layar := (
		pos.y > screen_size.y + SCREEN_MARGIN
		or pos.y < -SCREEN_MARGIN
		or pos.x < -SCREEN_MARGIN
		or pos.x > screen_size.x + SCREEN_MARGIN
	)
	if keluar_layar:
		reset_level()

func _unhandled_input(event):
	# Reset manual dengan menekan tombol R.
	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_R:
		reset_level()

func reset_level():
	if _resetting:
		return
	_resetting = true
	print("Level reset")
	get_tree().reload_current_scene()
