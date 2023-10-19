//Desenhando a grana

var _n = 1;
var _alt = 20;
draw_set_halign(fa_center);
draw_set_font(fnt_din);
var _str = converte_num(global.money);
draw_text_transformed(view_get_wport(0)/2 , _alt * _n++ , _str, 2, 2, 0);


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
draw_text_transformed(view_get_wport(0)/2, _alt * _n++ + 35, _str + " p/s", 2, 2, 0);
draw_set_font(-1);
draw_set_halign(-1);
