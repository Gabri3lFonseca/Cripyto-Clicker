//Desenhando a grana

var _n = 1;
var _alt = 20;
draw_set_halign(0);
var _str = converte_num(global.money);
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
		
			with(_atual){
		
			if (tenho_manager && comprado){
				_dinheiro_seg += (lucro / tempo);
			}
		}	
	}
}
global.money_seg = _dinheiro_seg;
var _str = converte_num(global.money_seg);
draw_text(20, _alt * _n++, _str);

