//Checando se a pessoa clico nele
var _mouse_sobre = position_meeting(mouse_x - meu_x, mouse_y - meu_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre && comprado == false){
	if(_mouse_click){
		//Checando se a pessoa pode comprar
		if(global.money >= custo){
			global.money -= custo;
			//Avisando que foi comprado
			global.manegers[indice] = true;
			comprado = true;
			
			//Avisando ao produto que ele deve fazer sempre
			global.produtos[indice].fazer = true;
			global.produtos[indice].tenho_menager = true;
			
			
		}
	}
}




