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

if(texto3_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto3) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto3_aparece = false;
		}
	}
}

if(texto4_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto4) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto4_aparece = false;
		}
	}
}

if(texto5_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto5) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto5_aparece = false;
		}
	}
}

if(texto6_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto6) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto6_aparece = false;
		}
	}
}

if(texto7_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto7) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto7_aparece = false;
		}
	}
}

if(texto8_aparece == true){
	if (mouse_check_button_pressed(mb_left) && device_mouse_y_to_gui(0) >= _y){
	
		if (pagina < array_length(texto8) - 1){
			pagina++;
		
		} else {
			instance_destroy();
			texto8_aparece = false;
		}
	}
}