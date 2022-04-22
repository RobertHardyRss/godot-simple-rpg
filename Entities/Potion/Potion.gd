tool
extends Area2D

enum Potion { HEALTH, MANA }
export(Potion) var type = Potion.HEALTH


# Called when the node enters the scene tree for the first time.
func _ready():
	if type == Potion.MANA:
		$Sprite.region_rect.position.x = 8
	else:
		$Sprite.region_rect.position.x = 0


func _process(delta):
	# this code only runs in the editor and is enabled using the "tool" command above
	# this allows us to see the proper strite in the editor 
	if Engine.editor_hint:
		if type == Potion.MANA:
			$Sprite.region_rect.position.x = 8
		else:
			$Sprite.region_rect.position.x = 0


func _on_Potion_body_entered(body):
	if body.name == "Player":
		body.add_potion(type)
		get_tree().queue_delete(self)
