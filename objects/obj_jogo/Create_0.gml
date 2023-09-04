//Lista de produtos 
produtos = [];

//Dados da surface dos produtos
surf_prod = noone;
prod_w = 860;
prod_h = 500;
prod_x = 48;
prod_y = 48;

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
		var _manager = instance_create_layer(900, 100 + i * 100, layer, obj_manager);
		
		_manager.custo = global.produtos[i].custo * 10;
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

function rolagem(_val = 10){
	
	var _qtd = 0;
	
	//Rolando a bolinha do mause
	if(mouse_wheel_down()){
		_qtd = -_val;
	}
	if(mouse_wheel_up()){
		_qtd = _val;
	}
	return _qtd;
}

function gerencia_produtos(){
	
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20;
	_meu_y += rolagem(30);
	
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
