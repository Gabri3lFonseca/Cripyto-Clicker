//Desenhando a grana

var _n = 1;
var _alt = 20;
draw_set_halign(0);
var _str = "R$ " + string_format(global.money, 0, 2);
draw_text(20, _alt * _n++, _str);
draw_set_halign(-1);

//Eu quero saber quanto dinheiro ganho por segundo
var _dinheiro_seg = 0;

//Descobrindo
//Rodando pelos produtos
for (var i = 0; i < array_length(global.produtos); i++){
	if(global.produtos[i] != 0){
		//Pegando informações do produto atual
		var _atual = global.produtos[i];
		_dinheiro_seg += _atual.lucro;
		break;
		
	}
}
draw_text(20, _alt * _n++, _dinheiro_seg);

