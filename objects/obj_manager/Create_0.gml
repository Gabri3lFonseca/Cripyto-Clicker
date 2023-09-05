

comprado = global.managers[indice];
meu_y = 0;
meu_x = 0;

function desenha_manager(){

	//Me desenhando
	draw_self();
	//Desenhando o custo
	draw_set_halign(1);
	draw_set_valign(1);
	var _str = converte_num(custo);
	var _txt = comprado == true ? "VENDIDO!!!" : _str;
	gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_text(x + sprite_width / 2, y, _txt);
	gpu_set_colorwriteenable(1, 1, 1, 1);
	draw_set_valign(-1);
	draw_set_valign(-1);

}