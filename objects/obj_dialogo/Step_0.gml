/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (iniciar == false){
	npc_nome = "Professor";
	src_texto();
	iniciar = true;
}

var _guia = display_get_gui_height();
var _y = _guia -200;

if(texto_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto_aparece = false;
		}
	}
}

if(texto1_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto1) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto1_aparece = false;
		}
	}
}

if(texto2_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto2) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto2_aparece = false;
		}
	}
}
