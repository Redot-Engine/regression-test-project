extends Spatial

var TIME_TO_DELETE : float = 1.0
var time_to_delete : float = TIME_TO_DELETE

func _populate() -> void:
	for _i in range(4):
		add_child(Spatial.new())
		add_child(ARVRAnchor.new())
		add_child(Camera.new())
		add_child(ARVRCamera.new())
		add_child(ClippedCamera.new())
		add_child(InterpolatedCamera.new())
		add_child(ARVRController.new())
		add_child(ARVROrigin.new())
		add_child(AnimatedSprite3D.new())
		add_child(Sprite3D.new())
		add_child(CPUParticles.new())
		add_child(CSGBox.new())
		add_child(CSGCylinder.new())
		add_child(CSGMesh.new())
		add_child(CSGPolygon.new())
		add_child(CSGSphere.new())
		add_child(CSGTorus.new())
		add_child(CSGCombiner.new())
		add_child(ImmediateGeometry.new())
		add_child(MeshInstance.new())
		add_child(SoftBody.new())
		add_child(MultiMeshInstance.new())
		add_child(Particles.new())
		add_child(BakedLightmap.new())
		add_child(DirectionalLight.new())
		add_child(OmniLight.new())
		add_child(SpotLight.new())
		add_child(GIProbe.new())
		add_child(ReflectionProbe.new())
		add_child(Area.new())
		add_child(KinematicBody.new())
		add_child(PhysicalBone.new())
		add_child(RigidBody.new())
		add_child(VehicleBody.new())
		add_child(StaticBody.new())
		add_child(AudioStreamPlayer3D.new())
		add_child(BoneAttachment.new())
		add_child(CollisionPolygon.new())
		add_child(CollisionShape.new())
		add_child(ConeTwistJoint.new())
		add_child(Generic6DOFJoint.new())
		add_child(HingeJoint.new())
		add_child(PinJoint.new())
		add_child(SliderJoint.new())
		add_child(GridMap.new())
		add_child(Listener.new())
		add_child(Navigation.new())
		add_child(NavigationMeshInstance.new())
		add_child(Path.new())
		add_child(PathFollow.new())
		add_child(Position3D.new())
		add_child(ProximityGroup.new())
		add_child(RayCast.new())
		add_child(RemoteTransform.new())
		add_child(Skeleton.new())
		add_child(SpringArm.new())
		add_child(VehicleWheel.new())
		add_child(VisibilityNotifier.new())
		add_child(VisibilityEnabler.new())

func _ready() -> void:
	_populate()

func _process(delta: float) -> void:
	for i in get_children():
		if i.get_name() != "Camera":
			i.set_scale(Vector3(delta + 1, delta + 1, delta + 1))
			i.set_translation(Vector3(10 * randf(), 10 * randf(), 10 * randf()))
			
	time_to_delete -= delta
	if time_to_delete < 0:
		time_to_delete += TIME_TO_DELETE
		
		for i in get_children():
			i.queue_free()
			
		_populate()
