

comprado = global.manegers[indice];

function desenha_manager(){

	//Me desenhando
	draw_self();
	//Desenhando o custo
	draw_set_halign(1);
	draw_set_valign(1);
	var _str = converte_num(custo);
	var _txt = comprado == true ? "VENDIDO!!!" : _str;
	draw_text(x + sprite_width / 2, y, _txt);
	draw_set_valign(-1);
	draw_set_valign(-1);

}