/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
prof_nome = "";
texto[0] = "";

iniciar = false;

//Desenhando o dialogo
function desenha_dialogo(){

	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _x = 0;
	var _y = _guia -200;
	
	//Quando desenhar
	if (global.money >= 500){
	
		draw_rectangle_color(_x, _y, _guil, _guia, c_black, c_black, c_black, c_black, false);
		draw_text_ext(_x + 32, _y + 32, texto[1], 32, _guil - 64);
	
	}
}




