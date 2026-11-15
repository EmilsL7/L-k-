extends Sprite2D


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if !("velocity" in body):
		return
	
	print(body.velocity)
	if abs(body.velocity.x)>300:
		queue_free()
