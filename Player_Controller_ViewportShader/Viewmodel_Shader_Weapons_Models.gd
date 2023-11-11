@tool

#Credit to 2nafish117
#https://github.com/2nafish117/godot-viewmodel-render-test
#https://www.youtube.com/@2nafish117
#They made this script for 3.5, I just converted to Godot 4 and Made the tool script suit this project.

extends Node3D

signal Set_FOV_at_Start

@export var Meshes_Wish_Shader: Array[MeshInstance3D]
@export var viewmodelfov: float = 50.0 :set = set_view_model_fov

func _ready():
	if not Engine.is_editor_hint():
		Set_FOV_at_Start.emit(viewmodelfov)

func set_view_model_fov(val: float):
	viewmodelfov = val
	set_mesh_fov(viewmodelfov)

func set_mesh_fov(val: float):
	for n in Meshes_Wish_Shader:
		if n != null:
			for i in range(n.mesh.get_surface_count()):
				var mat: Material = n.get_active_material(i)
				if mat is ShaderMaterial:
					mat.set_shader_parameter("viewmodel_fov", val)

func _on_h_slider_value_changed(value):
	viewmodelfov = value
