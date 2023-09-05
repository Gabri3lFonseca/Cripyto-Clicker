//Criei o objeto jogo, eu carrego as informações
load_game();

//Lista de produtos 
produtos = [];
managers = [];

//Dados da surface dos managers
surf_man = noone;
man_w = 400;
man_h_base = 500;
man_h = 1;
man_x = 1000;
man_y = 88;

//Dados da surface dos produtos
surf_prod = noone;
prod_w = 860;
prod_h = 500;
prod_x = 148;
prod_y = 88;

base_y = 80;
produtos_y = 0 + base_y;
function cria_produtos(_qtd = 1){
	for(var i = 0; i < _qtd; i++){
		
		//Struct com os meus dados que eu estou pegando do meu json
		var _struct = global.struct_produtos[i];
		produtos[i] = instance_create_layer(0, 0, layer, obj_produto, _struct);
		
	}
}

function cria_managers(){
	//1 manager para cada produto
	for (var i = 0; i < array_length(produtos); i++){
		var _meu_produto 
		managers[i] = instance_create_layer(900, 100 + i * 100, layer, obj_manager);
		
		managers[i].custo = global.produtos[i].custo * 10;
		managers[i].indice = i;
	}
}	

function rolagem_produtos(){
	
	if(keyboard_check(vk_up)){
		produtos_y -= 10;
	}
	if(vk_down){
		produtos_y += 10;
	}
	
	// Descobrindo o valor maximo da rolagem
	var _qtd = array_length(produtos);
	var _max = (96 * _qtd) + (20 * _qtd) + 20 - room_height;
	//Limitando a rolagem dos produtos
	produtos_y = clamp(produtos_y, -_max, base_y);
	
}

function rolagem(_val = 10, _x = 0, _y = 0, _w = 0, _h = 0){
	
	var _qtd = 0;
	var _fazer = false;
	//show_message(_w);
	if(_w != 0){
		_fazer = point_in_rectangle(mouse_x, mouse_y, _x, _y, _x + _w, _y + _h);
		//show_debug_message("foi");
	}
	
	if(_fazer){
		//Rolando a bolinha do mause
		if(mouse_wheel_down()){
			_qtd = -_val;
		}
		if(mouse_wheel_up()){
			_qtd = _val;
		}
	}	
		return _qtd;	
}



function gerencia_manager(){
	
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20;
	
	_meu_y += rolagem(30, man_x, man_y, man_w, man_h);
	
	var _qtd = array_length(managers);
	var _max = (_alt * _qtd) + (_marg * _qtd) +_marg - man_h;
	//limitando meu y
	_meu_y = clamp(_meu_y, -_max, 0);
	
	for(var i = 0; i < _qtd; i++){
	
		var _x = 0;
		var _y = _meu_y + _marg + ((i * _alt) + (i * _marg));
		
		with(managers[i]){
			x = _x;
			y = _y + sprite_height/2;
		}
	}
}
//Criando minha surface dos meus managers
function desenha_managers(){

	//Mudando o tamanho da surface com base na glogal exibe managers
	if (global.exibe_manegers){
		man_h = lerp(man_h, man_h_base, .1);
	}
	else{
		man_h = lerp(man_h, 1, .1);	
	}
	show_debug_message(man_h);

	//Chegando se a suface existe
	if(surface_exists(surf_man)){
		//Fazer coisas na surface
		//Codfigurando minha surface
		surface_set_target(surf_man);
		draw_clear_alpha(c_black, 0);
		
		//draw_rectangle_color(0, 0, man_w, man_h, c_blue, c_blue, c_blue, c_blue, false);
		
		
		
		//Desenhando os managers
		if(man_h > 3){
			with(obj_manager){
					desenha_manager();
					meu_x = other.man_x;
					meu_y = other.man_y;
				}
		}
		
		
		
		//Resetando a surface
		surface_reset_target();
		
		//Desenhando a minha surface
		draw_surface(surf_man, man_x, man_y);
		
		surface_resize(surf_man, man_w, man_h);
	}
	else{
		//Se ela não existe eu crio ela...
		surf_man = surface_create(man_w, man_h);
	}
}

function gerencia_produtos(){
	
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20;
	
	_meu_y += rolagem(30, prod_x, prod_y, prod_w/2, prod_h);
	
	var _qtd = array_length(produtos);
	var _max = (_alt * _qtd) + (_marg * _qtd) +_marg - prod_h;
	//limitando meu y
	_meu_y = clamp(_meu_y, -_max, 0);
	
	for (var i = 0; i < array_length(produtos); i++){
		var _x = 30;
		var _y = _meu_y + _marg + ((i * _alt) + (i * _marg));
		
		with(produtos[i]){
			x = _x;
			y = _y + sprite_height/2;
		}
	}
}
//Criando minha surface dos meus produtos
function desenha_produtos(){

	//Chegando se a suface existe
	if(surface_exists(surf_prod)){
		//Fazer coisas na surface
		//Codfigurando minha surface
		surface_set_target(surf_prod);
		draw_clear_alpha(c_black, 0);
		
		//draw_rectangle_color(0, 0, prod_w, prod_h, c_black, c_black, c_black, c_black, false);
		
		
		
		//Desenhando os produtos
		with(obj_produto){
			desenha_produto();
			meu_x = other.prod_x;
			meu_y = other.prod_y;
		}
		
		
		
		//Resetando a surface
		surface_reset_target();
		
		//Desenhando a minha surface
		draw_surface(surf_prod, prod_x, prod_y);
	}
	else{
		//Se ela não existe eu crio ela...
		surf_prod = surface_create(prod_w, prod_h);
	}
}

//Cria a quantidade de produtos que tem na minha struct
cria_produtos(array_length(global.struct_produtos));
cria_managers();
