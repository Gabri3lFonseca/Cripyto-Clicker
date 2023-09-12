/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.money =+ 500){
	var _npc = instance_nearest(x, y, obj_professor);
	var _dialogo instance_create_layer(x, y, "Dialogo", obj_dialogo);
	_dialogo.npc_nome = _npc.nome;
	show_debug_message("foi");
}




