// Configurando tempo do jogo.

//Configurando os frames por segundo(fps) do jogo.
#macro FRAMES 60
game_set_speed(FRAMES, gamespeed_fps);

//Usando o deltatime para definir o tempo do meu jogo.
//Velocidade do jogo:
global.game_spd = 1;
//Definindo framerate do jogo:
global.framerate = global.game_spd / FRAMES;
//Indetificando a duração de um 1 segundo no jogo:
global.gamesegundos = 0;

//Função para atualizar o tempo do jogo:
function atualiza_tempo(){
	//Pegando tempo em segundos
	global.gamesegundos = delta_time / 1000000;
	global.framerate = global.gamesegundos * global.game_spd;
}

global.exibe_managers = false;

//Variaveis de dinheiro
global.money = 5;

//Informação dos managers
global.managers = [0, 0, 0, 0, 0, 0, 0, 0];

//Lista dos produtos
global.produtos = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
global.produtos_info = array_create(10, 0);


//Abrindo meu jason
var _file = file_text_open_read("dados.json");
var _txt = "";
//Rodando pelo meu flie ate acabar todas as linhas
while(true){
	
	//Se ele chagar no final do arquivo ele sai do loop
	if(file_text_eof(_file)){	
	//Saindo do loop
	break;
	}
	//Ainda não saiu do loop
	else{
		var _linha = file_text_readln(_file);
		_txt += _linha;
	}
}

//Convertendo esse txt em uma struct
global.struct_produtos = json_parse(_txt).items;

//Fechando o arquivo

