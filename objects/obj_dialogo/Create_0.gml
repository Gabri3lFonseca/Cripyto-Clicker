/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
prof_nome = "Professor";
texto[0] = "";
texto_aparece = false;
texto1[0] = "";
texto1_aparece = false;
texto2[0] = "";
texto2_aparece = false;
texto3[0] = "";
texto4[0] = "";
pagina = 0;


iniciar = false;

upgrade = noone;

//Desenhando o dialogo
function desenha_dialogo(){

	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _x  = 250;
	var _y  = _guia -200;
	var _xs = 0;
	var _ys = _guia -320;
	
	
	var _level = [0,0,0,0,0,0,0,0,0,0];
	
	for (var i = 0; i < array_length(_level); ++i) {
	    _level[i] = global.produtos[i].level;
		//show_debug_message(_level);
	}
		
		if (_level[3] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto4[pagina], 32, 1300);
			exit;
		}
		
		//if (_level[2] == 1 && upgrade == 1){
		//	sobrepoe();
		//	draw_sprite(spr_prof36, 0, _xs, _ys);
		//	draw_sprite(spr_balao, 0, _x, _y - 60);
		//	draw_set_halign(fa_left);
		//	draw_text_ext(_x + 32, _y - 32, texto3[pagina], 32, 1300);
		//	exit;
		//}
		
		if (_level[1] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto2[pagina], 32, 1300);
			texto2_aparece = true;
			exit;
		}
		
		if (_level[0] == 1 && upgrade == 1){
			//show_message("foiiiiii");
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto1[pagina], 32, 1300);
			texto1_aparece = true;
			exit;
		}
		
		if (_level[0] == 0 ){
			//show_message("foiiiiii");
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto[pagina], 32, 1300);
			texto_aparece = true;
		}
}


//Sobrepondo o jogo e direcionando o foco do jogador para o dialogo
function sobrepoe(){

	draw_set_alpha(.7);
	draw_rectangle_color(-1, -1, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
}


