/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Checando se a pessoa clico nele
var _mouse_sobre = position_meeting(mouse_x - meu_x, mouse_y - meu_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if (_mouse_sobre){
	
	if(_mouse_click)
		{
			room_goto(rm_menu);
		}
}

