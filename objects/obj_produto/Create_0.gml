//Meu level
level = 0;

//mais informações
timer = 0;

meu_x = 0;
meu_y = 0;

//Definindo se devo fazer
fazer = false;
infos = false;

tenho_manager = false;

//Meus custos
custo = custo_base;
comprado = false;

//Efeito np Botão de compra
efeito_comprar = false;

//Meus ganhos
lucro = lucro_base;

//Me inserindo na lista de produtos
global.produtos[indice] = id;

incremento = 1.07;

//Comprando o produto
function comprar(){
			
	//Tira o dinheiro da pessoa
	global.money -= custo;
	comprado = true;
	
	//Definindo o custo
	var _custo_atual = floor(custo_base * (power(incremento, level)));
	
	//Aumentando o custo
	custo += _custo_atual;  
	
	//Ajustanto o lucro
	//Subir um level
	level ++;
	
	//Lucro vai ser com base no level e lucro base
	lucro = lucro_base * level;

}

function ajusta_infos(){

	lucro = lucro_base * level;
	custo = floor(custo_base * (power(incremento, level)));
	//custo += _custo_atual;
	//Atualizando o comprado
	if (comprado) fazer = true;
	

}


//Ação de compra e efeitos
function acao(){
	timer = 0;
	fazer = tenho_manager;
	//Dando o lucro
	global.money += lucro;
}

//Desenhando produto
function desenha_produto(){
	//Me desenhando
	draw_self();
	
	draw_set_font(fnt_texto);
	
	//Desenhando o produto
	draw_sprite(spr_placa, indice, x-25, y-45);
	
	//Alinhando do texto
	draw_set_valign(1);
	draw_set_halign(1);

	//Meu level
	//Desenhando uma ellipse
	draw_sprite(spr_ellipse, 0, x-5, y+10);
	
	//Configurando o alpha
	gpu_set_colorwriteenable(1, 1, 1, 0)
	
	draw_text(x+26, y+26, level);
	
	//Resetando
	gpu_set_colorwriteenable(1, 1, 1, 1)
		
		
	
	//Desenhando baarra de progressso?
	var _x1 = x + 100;
	var _y1 = y - 35;
	var _larg = sprite_width / 1.4;
	var _x2 = _x1 + _larg;
	var _y2 = _y1 + sprite_height / 4;
	//Desenhando a borda barra de progresso
	draw_rectangle_color(_x1 -2, _y1-2, _x2+2, _y2+2, c_black, c_black, c_black, c_black, false);
	//Desenhando o fundo barra de progresso
	draw_rectangle_color(_x1, _y1, _x2, _y2, c_gray, c_gray, c_gray, c_gray, false);
	//Desenhando progresso o da barra
	var _progresso = (timer / tempo) * _larg;
	draw_rectangle_color(_x1, _y1, _x1 + _progresso, _y2, c_green, c_green, c_green, c_green, false);
	//Desenhando quanto vou lucrar
	//Ajustando alinhamento
	draw_set_halign(2);
	var _str = converte_num(lucro)
	//Configurando o alpha
	gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_text(_x2 - 10, _y1 + sprite_height / 8, _str);
	//Voltando alinhamento para o centro
	draw_set_halign(1);

	//Desenhando o meu preço
	//Desenhando o quadrado do preço
	_x1 = x + 100;
	_y1 = y + 8;
	var _larg = sprite_width / 3;
	_x2 = _x1 + _larg;
	_y2 = _y1 + 32;
	//Definindo a cor de acordo com a possibilidade de compra
	var _cor = global.money >= custo ? c_green : c_gray
	var _str = converte_num(custo);

	//Desenhando umas bordas se o mouse estiver por cima de mim
	if(efeito_comprar){
		draw_rectangle_color(_x1-1, _y1-1, _x2+1, _y2+1, c_yellow, c_yellow, c_yellow, c_yellow, 0);	
	}

	draw_rectangle_color(_x1, _y1, _x2, _y2, _cor, _cor, _cor, _cor, 0);
	draw_text_transformed(_x1+_larg/2, _y1+16, _str, 1, 1, 0); 
	
	

	//Desenhando o tempo que leva
	//Descobrindo quantos segundo ele leva
	var _s = floor((tempo - timer) % 60);
	var _m = ((tempo - timer) div 60) % 60;
	var _h = ((tempo - timer) div 60)div 60;
	draw_set_halign(2);

	//Definindo a exibição do texto bunitinha
	var _seg = _s > 9 ? _s : "0" + string(_s);
	var _min = _m > 9 ? _m : "0" + string(_m);
	var _hor = _h > 9 ? _h : "0" + string(_h);
	draw_text(x + sprite_width - 24 , _y1+16, string("{0}:{1}:{2}", _hor, _min, _seg));
	gpu_set_colorwriteenable(1, 1, 1, 1);
	draw_set_halign(1);

	//Resetando alinhando do texto
	draw_set_valign(-1);
	draw_set_halign(-1);
	
	if(infos){
		exibe_info();
	}
	
	draw_set_font(-1);
}

//Exibindo as informaçoes do produto
function exibe_info(){
	
	var _x1 = x+sprite_width+5;
	var _y1 = y-sprite_height/2;
	var _marg = 9;
	
	//Desenha minha caixa
	draw_sprite_stretched(spr_caixa, 0, _x1, _y1, sprite_width, sprite_height)
	gpu_set_colorwriteenable(1, 1, 1, 0);
	//Nome
	draw_text(_x1 + _marg, _y1 + _marg, nome)
	//Descrição
	draw_text_ext(_x1 + _marg, _y1 + 30, descricao, 20, sprite_width - _marg*2)
	gpu_set_colorwriteenable(1, 1, 1, 1);
}
