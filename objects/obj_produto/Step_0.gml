
if(comprado){
	if (fazer){
	//Aumentando o timer
	timer += global.framerate;

		//enchi a a barra
		if(timer > tempo){
			acao();
		}

	}
}
//Checando se a pessoa clico nele
var _mouse_sobre = position_meeting(mouse_x - meu_x, mouse_y - meu_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre){
	infos = true;
	if(_mouse_click)
	{
		fazer = true;
	}
	//Checando se o mause esta no botão de compra
	var _x1 = x + 100;
	var _y1 = y + 8;
	var _x2 = _x1 + sprite_width / 3;
	var _y2 = _y1 + 32;
	var _mouse_caixa = point_in_rectangle(mouse_x - meu_x, mouse_y - meu_y, _x1, _y1, _x2, _y2);
	efeito_comprar = _mouse_caixa;
	
	if(_mouse_caixa){
	//Ativando efeito de comprar
	efeito_comprar = _mouse_caixa;
	//Checando se a pessoa clico
	if(_mouse_click){
		//Checa se a pessoa tem dinheiro
		if(global.money >= custo){
			comprar();
		}
	}
	
	}
}
else{
	infos = false;
	efeito_comprar = false;
}	