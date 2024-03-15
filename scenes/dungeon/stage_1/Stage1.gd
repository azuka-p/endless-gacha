extends Control

const golem_stat = 50
var golem_hp := 500
var current: int


func _ready():
	print(StageData.selected_team)
	print(StageData.team_stats)
	$Player.add_child(StageData.selected_team[current])
	$Player.get_child(1).position = Vector2(810, 472)


func _on_Attack_pressed():
	$VBoxContainer/Attack.disabled = true
	$VBoxContainer/HBoxContainer/Prev.disabled = true
	$VBoxContainer/HBoxContainer/Next.disabled = true
	
	var character = $Player.get_child(1)
	character.position = Vector2(420, 472)
	character.play_animation("attack")
	var base = character.get_child(0).get_child(0)
	if not base.is_connected("animation_finished", self, "_on_PlayerAttack_end"):
		# warning-ignore:return_value_discarded
		base.connect("animation_finished", self, "_on_PlayerAttack_end")
	golem_hp -= StageData.team_stats[current].attack
	$Enemy/HealthBar.value = stepify(float(golem_hp) / 5, 0.01)
	
	yield(get_tree().create_timer(1.2), "timeout")
	if golem_hp <= 0:
		$Enemy/HealthBar.value = 0
		$Enemy/Golem/AnimatedSprite.play("die")
		yield(get_tree().create_timer(1), "timeout")
		if win_condition():
			return
	
	$Enemy/Golem.position = Vector2(500, 280)
	$Enemy/Golem/AnimatedSprite.play("attack")
	if not $Enemy/Golem/AnimatedSprite.is_connected("animation_finished", self, "_on_EnemyAttack_end"):
		# warning-ignore:return_value_discarded
		$Enemy/Golem/AnimatedSprite.connect("animation_finished", self, "_on_EnemyAttack_end")
	StageData.team_stats[current].hp -= golem_stat
	$Player/HealthBar.value = stepify(float(StageData.team_stats[current].hp) / StageData.max_hp[current] * 100, 0.01)
	
	yield(get_tree().create_timer(1.2), "timeout")
	if StageData.team_stats[current].hp <= 0:
		$Player/HealthBar.value = 0
		character.play_animation("die")
		yield(get_tree().create_timer(1), "timeout")
		if character_died():
			return
	$VBoxContainer/Attack.disabled = false
	$VBoxContainer/HBoxContainer/Prev.disabled = false
	$VBoxContainer/HBoxContainer/Next.disabled = false
	
	print(golem_hp)
	print(StageData.team_stats[current].hp)


func _on_PlayerAttack_end():
	$Player.get_child(1).position = Vector2(810, 472)


func _on_EnemyAttack_end():
	$Enemy/Golem.position = Vector2(150, 280)


func update_player():  # Change var current before calling this
	$Player.remove_child($Player.get_child(1))
	$Player.add_child(StageData.selected_team[current])
	$Player.get_child(1).position = Vector2(810, 472)
	$Player/HealthBar.value = stepify(float(StageData.team_stats[current].hp) / StageData.max_hp[current] * 100, 0.01)


func win_condition():
	for n in StageData.selected_team:
		n.add_exp(100)
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/dungeon/DungeonScreen.tscn")
	return true


func character_died():
	print(StageData.selected_team)
	var ded = StageData.selected_team.pop_at(current)
	StageData.team_stats.remove(current); StageData.max_hp.remove(current)
	CharacterInventory.characters.erase(ded)
	print(StageData.selected_team)
	
	if StageData.selected_team.size() == 0:
		# GAMEOVER
		print("GAMEOVER")
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/dungeon/DungeonScreen.tscn")
		return true
	elif current > StageData.selected_team.size() - 1:
		current = 0
	update_player()
	return false


func _on_Prev_pressed():
	if StageData.selected_team.size() == 1:
		return
	current -= 1
	if current < 0:
		current = StageData.selected_team.size() - 1
	update_player()


func _on_Next_pressed():
	if StageData.selected_team.size() == 1:
		return
	current += 1
	if current > StageData.selected_team.size() - 1:
		current = 0
	update_player()


func _on_Stage1_tree_exiting():
	if $Player.get_child_count() == 2:
		$Player.remove_child($Player.get_child(1))


func _on_Stage1_tree_exited():
	for n in StageData.selected_team:
		n.position = Vector2(0, 0)
	StageData.selected_team = []
	StageData.selected_stage = 0
	StageData.team_stats = []
	StageData.max_hp = []
