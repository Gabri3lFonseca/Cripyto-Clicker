/// @description Inserir descrição aqui

//Seleção do menu
sel = 0;
marg_val = 32;
marg_total = 32;

#region METODOS

function desenha_menu(_menu){
	
	//Definindo minha fonte
	draw_set_font(fnt_menu);

	//Alinhando o texto
	draw_set_valign(1);
	draw_set_halign(0);

	//desenhando menu
	//Pegando o tamanho do menu
	var _qtd = array_length(_menu);

	//Pegando altura da tele
	var _alt = display_get_gui_height();

	//Definindo o espaço entre linhas e a cor
	var _espaco_y = string_height("I") + 16;
	var _alt_menu = _espaco_y * _qtd;



	//Desenhando opçoes
	for (var i = 0; i < _qtd; ++i) {
    
		//Definindo cor
		var _cor = c_white, _marg_x = 0;
	
		//Desenhando o item do menu
		var _texto = _menu[i];
	
	
		//Permitindo a seleção
		if (sel == i) {
	    
			_cor = c_blue;
			_marg_x = marg_val;
		
		}
		draw_text_color(20 + _marg_x, (_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _texto,  _cor, _cor, _cor, _cor, 1);
	}



	//Resetando minha fonte
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	
}	

//Contralando o menu
function controla_menu(_menu){
	
	//Pegando as teclas
	var _up, _down, _avanca, _recua;

	 static _animar = false;

	_up		= keyboard_check_pressed(vk_up);
	_down	= keyboard_check_pressed(vk_down);
	_avanca = keyboard_check_pressed(vk_enter);
	_recua = keyboard_check_pressed(vk_escape);

	if (_up or _down) {
	    //Mudando o valor so sel
		sel += _down - _up;
	
		//limitando o sel
		var _tam = array_length(_menu) - 1;
		sel = clamp(sel, 0, _tam);
		
		//Avisando que pode animar
		_animar = true;
	}
	
	//Aumentando sempre o marg_val
	if(_animar){
	marg_val = marg_total * valor_ac(ac_margem, _up ^^ _down);
	}
}	

function iniciar(){

show_message("teste");

}

#endregion

//Quando eu apertar enter no iniciar, ele vai rodar um metodo.
//Quando eu apertar enter no opções, ele para o menu de opções.
//Quando eu apertar enter no sair, ele vai fechar o jogo.

//Texto - Ação - Conteudo da ação

//Crian meu menu
menu = ["Iniciar", "Opções", "Sair"]
