extends Node
class_name AudioManager

# =========================================================
# AUDIO MANAGER
# =========================================================

# Global audio system for the project.
# Used as an autoload, so that singleton sounds can be played from anywhere:
	# AudioManager.play_sfx("mouse_click")

# ===== AUDIO LIBRARIES =====

const SFX := {
	"mouse_click": "res://assets/audio/sfx/mouse-click.mp3",
}

const MUSIC := {
	# "main_theme": "res://assets/audio/music/main-theme.mp3",
}


# ===== INTERNAL PLAYER REFERENCES =====

var _music_player: AudioStreamPlayer
var _sfx_container: Node


# ===== INITIALIZATION =====

func _ready() -> void:
	_setup_audio_players()


# ===== SETUP =====

func _setup_audio_players() -> void:
	# Container for dynamically created SFX players
	_sfx_container = Node.new()
	_sfx_container.name = "SFXPlayers"
	add_child(_sfx_container)

	# Dedicated music player
	_music_player = AudioStreamPlayer.new()
	_music_player.name = "MusicPlayer"
	add_child(_music_player)


# ===== SOUND EFFECTS =====

func play_sfx(sound_id: String, volume_db: float = 0.0) -> void:
	# Prevent errors if sound does not exist
	if not SFX.has(sound_id):
		push_warning("AudioManager: Unknown SFX ID: " + sound_id)
		return

	var sound_path: String = SFX[sound_id]

	# Load audio resource
	var stream := load(sound_path) as AudioStream

	if stream == null:
		push_warning("AudioManager: Failed to load SFX: " + sound_path)
		return

	# Create temporary player
	var player := AudioStreamPlayer.new()

	player.stream = stream
	player.volume_db = volume_db

	# Add player to scene tree
	_sfx_container.add_child(player)

	# Clean up automatically after playback
	player.finished.connect(player.queue_free)

	# Play sound
	player.play()


# ===== MUSIC =====

func play_music(track_id: String, volume_db: float = 0.0) -> void:
	if not MUSIC.has(track_id):
		push_warning("AudioManager: Unknown Music ID: " + track_id)
		return

	var track_path: String = MUSIC[track_id]

	var stream := load(track_path) as AudioStream

	if stream == null:
		push_warning("AudioManager: Failed to load Music: " + track_path)
		return

	_music_player.stop()

	_music_player.stream = stream
	_music_player.volume_db = volume_db
	_music_player.play()


func stop_music() -> void:
	_music_player.stop()


# ===== UTILITY =====
func has_sfx(sound_id: String) -> bool:
	return SFX.has(sound_id)


func has_music(track_id: String) -> bool:
	return MUSIC.has(track_id)
