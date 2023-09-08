
function converte_num(_num){

	//Desenhando o custo de outra forma
	var _custo2 = _num;
	var _valores = ["", "K", "M", "B", "T", "B"];
	var _i = 0;
	
	//Sepre que o valor for maior que mil eu tiro 3 zeros dele
	while(_custo2 > 1000){
		//Tirar os 3 zeros
		_custo2 /= 1000;
		
		//Cada vez que rodar vai subir uma casa
		_i++;
	}
	
	var _str2 = "R$ " + string_format(_custo2, 0, 2) + _valores[_i];
	return _str2;
}
//Salvando o jogo
function save_game(){

	//Abrindo o arquivo
	var _file = file_text_open_write("save.json");
	
	//Sabendo quais produtos ja foram comprados
	//Criando um vetor para quantos produtos ao todo eu tenho
	var _qtd_prod = array_create(array_length(global.produtos), 0);
	
	//Criando um metodo para criar a estrutura com os dados de cada produto
	var _salva_dados = function(_elemento, _indice){
	
	//Pegando as informações do elemento
		_elemento = { 
			comprado	  : global.produtos[_indice].comprado,
			level		  : global.produtos[_indice].level,
			tenho_manager : global.produtos[_indice].tenho_manager
			};
	
			//show_message(_elemento);
			return _elemento;
	
	}
	
	//Interrar pelo array e  criar a estrutura com os dados
	var _produtos = array_map(_qtd_prod, _salva_dados);
	
	
	
	//Criando a estrutura que vai salvar o jogo
	var _struct = 
	{ 
		money	 : global.money,
		produtos : _produtos
	
	};
	
	//show_message(_struct);
	
	//Convertendo struct em uma string
	var _string = json_stringify(_struct);
	
	//Mandando ele salvar
	file_text_write_string(_file, _string);
	
	//Fechando o arquivo
	file_text_close(_file);
	
}

//Carregando o jogo
function load_game(){
	
	//Abrindo o arquivo
	if(file_exists("save.json")){

	//Abrindo arquivo
	var _file = file_text_open_read("save.json");
	
	//Pagando informaçoes do arquivo
	var _string = file_text_read_string(_file);

	//Convertendo a string em uma struct
	var _struct = json_parse(_string);
	
	//Passando o gold para o jogo
	global.money = _struct.money;
	
	//Passando as informações dos produtos para o jogo
	global.produtos_info = _struct.produtos;
	//show_message(global.produtos_info);
	
	//Fechando o arquivo
	file_text_close(_file);
	
	}	
}