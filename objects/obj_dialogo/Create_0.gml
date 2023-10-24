/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
prof_nome = "Professor";

//Criandom o meu texto e a variavel que verifica se ele esta na tela ou não
texto[0] = "";
texto_aparece = false;

texto1[0] = "";
texto1_aparece = false;

texto2[0] = "";
texto2_aparece = false;

texto3[0] = "";
texto3_aparece = false;

texto4[0] = "";
texto4_aparece = false;

texto5[0] = "";
texto5_aparece = false;

texto6[0] = "";
texto6_aparece = false;

texto7[0] = "";
texto7_aparece = false;

texto8[0] = "";
texto8_aparece = false;

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
		
		if (_level[9] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto8[pagina], 32, 1300);
			texto8_aparece = true;
			exit;
		}
		
		if (_level[8] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto7[pagina], 32, 1300);
			texto7_aparece = true;
			exit;
		}
		
		if (_level[6] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto6[pagina], 32, 1300);
			texto6_aparece = true;
			exit;
		}
		
		if (_level[5] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto5[pagina], 32, 1300);
			texto5_aparece = true;
			exit;
		}
		
		if (_level[3] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto4[pagina], 32, 1300);
			texto4_aparece = true;
			exit;
		}
		
		if (_level[2] == 1 && upgrade == 1){
			sobrepoe();
			draw_sprite(spr_prof36, 0, _xs, _ys);
			draw_sprite(spr_balao, 0, _x, _y - 60);
			draw_set_halign(fa_left);
			draw_text_ext(_x + 32, _y - 32, texto3[pagina], 32, 1300);
			texto3_aparece = true;
			exit;
		}
		
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




