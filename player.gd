extends RigidBody2D

var started = false

func _physics_process(delta):
	if Input.is_action_just_pressed("swim"):
		if !started:
			start_swim()
		swim_speed()

	if position.y >= 500:
		gravity_scale = 0
		linear_velocity.y = 0
		$AnimationPlayer.stop()

func start_swim():
	started = true
	gravity_scale = 5.0
	$AnimationPlayer.play("swim")

func swim_speed():
	linear_velocity.y = -200


func _on_hitbox_body_entered(body):
	if (!self.is_queued_for_deletion() && body.is_in_group("rocks")):
		queue_free()
