/// @description Inserir descrição aqui

meu_x = 0;
meu_y = 0;

function desenha_livro(){
	
	
	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _x  = 250;
	var _y  = _guia -200;
	var _xs = 0;
	var _ys = _guia -320;
	draw_text_ext(_x + 32, _y - 32, texto8[pagina], 32, 1300);
	show_debug_message(_guia, _guil);

}





