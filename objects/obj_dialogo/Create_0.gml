/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
prof_nome = "";
texto[0] = "";
pagina = 0;

iniciar = false;

//Desenhando o dialogo
function desenha_dialogo(){

	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _x  = 250;
	var _y  = _guia -200;
	var _xs = 0;
	var _ys = _guia -320;
	
	//for (var i = 0; i < 10; i++){
	
		
			if (global.produtos_info[0].comprado /*&& global.produtos_info[0].level == 1*/){
				sobrepoe();
				draw_sprite(spr_prof36, 0, _xs, _ys);
				//draw_rectangle_color(_x, _y, _guil, _guia, c_black, c_black, c_black, c_black, false);
				draw_sprite(spr_balao, 0, _x, _y - 60);
				draw_text_ext(_x + 32, _y - 32, texto[pagina], 32, 1300);
				
			}
		
		
		
	
	
	
	
	
}

//Sobrepondo o jogo e direcionando o foco do jogador para o dialogo
function sobrepoe(){

	draw_set_alpha(.7);
	draw_rectangle_color(-1, -1, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
}



