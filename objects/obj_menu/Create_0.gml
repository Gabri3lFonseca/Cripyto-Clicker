/// @description Inserir descrição aqui

//Seleção do menu
sel = 0;
marg_val = 32;
marg_total = 32;

//Controlndo a pagina do menu
pag = 0;

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
		var _texto = _menu[i][0];
	
	
		//Permitindo a seleção
		if (menus_sel[pag] == i) {
	    
			_cor = c_yellow;
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
	
	var _sel = menus_sel[pag];

	 static _animar = false;

	_up		= keyboard_check_pressed(vk_up);
	_down	= keyboard_check_pressed(vk_down);
	_avanca = keyboard_check_pressed(vk_enter);
	_recua  = keyboard_check_pressed(vk_escape);

	if (_up or _down) {
	    //Mudando o valor so sel
		menus_sel[pag] += _down - _up;
	
		//limitando o sel
		var _tam = array_length(_menu) - 1;
		menus_sel[pag] = clamp(menus_sel[pag], 0, _tam);
		
		//Avisando que pode animar
		_animar = true;
	}
	
	//Oque fazer quando eu aperta o enter
	if (_avanca) {
	    switch(_menu[menus_sel[pag]][1])
		{
			//caso seja 0, ele roda um metodo
			case 0: _menu[menus_sel[pag]][2](); break;
			//Mudar o valor da pagina
			case 1: pag = _menu[menus_sel[pag]][2]; break;
		}
	}
	
	//Aumentando sempre o marg_val
	if(_animar){
	marg_val = marg_total * valor_ac(ac_margem, _up ^^ _down);
	}
}	

function iniciar_jogo(){

	//Indo para a room inicial do jogo
	room_goto(rm_teste);

}

function deletar_save(){
	
	game_end();
	file_delete("save.json");

}


function sair_jogo(){

	//Fechando o jogo
	game_end();

}

function carrega_dialogo(_dialogo){
		  
	 show_message("Olá, eu sou o Bit, irei te acompanhar nessa jornada te ensinando os conceitos básicos das criptomoedas e como minerar criptomoedas. A qualquer momento você poderá consultar meus ensinamentos já desbloqueados clicando no botão com um ícone de um livro no canto superior direito da tela. Então vamos começar comprando o seu primeiro computador? Assim que o compra-lo pode continuar melhorando ele, e clicando nele você consegue mais dinheiro.");
}
function carrega_dialogo1(_dialogo){
		
	 show_message("Agora com o seu primeiro computador você irá começar a minerar criptomoedas, mas imagino que você  ainda não sabe o que são ou como funcionam não é mesmo? Então preste bem atenção agora!!!Criptomoedas são como o dinheiro que você usa no dia a dia, mas elas só existem na internet. Você pode usar elas para comprar e vender coisas online, sem precisar de um banco ou de um governo para controlar elas.");
	 show_message("Para começar a usar as moedas digitais, você precisa ter um lugar para guardar elas. Esse lugar é chamado de carteira digital, e é como uma conta bancária online. Cada carteira tem um número e uma senha, que são usados para enviar e receber as moedas digitais. O número é como o seu endereço, e a senha é como a sua chave. Você nunca deve contar a sua senha para ninguém.");	
	 show_message("Por enquanto é isso que você precisa saber, eu já instalei e o configurei no seu computador o'que era preciso para você começar a minerar. Continue minerando para melhorar o seu computador e assim que comprar sua primeira placa de vídeo venho aqui te ensinar mais sobre a mineração. Boa sorte !!!");
	 show_message("Ops, quase esqueci de te falar sobre os gerentes a direita da tela, você pode contratá-los para automatizar a sua produção e assim maximizar seus ganhos quando não estiver ativo. Agora sim boa sorte !!!");
	 }
function carrega_dialogo2(_dialogo){
		  
	 show_message(" Agora com sua primeira placa de vídeo podemos começar a ganhar mais dinheiro através da mineração. Pra você entender como funciona as criptomoedas são transferidas de uma carteira para outra através de transações, que são registradas em um livro público e compartilhado, chamado de blockchain.");
	 show_message("O blockchain é como um histórico de todas as transações que já aconteceram na rede de uma criptomoeda. Ele é atualizado constantemente pelos computadores que participam da rede, que verificam se as transações são válidas e não foram fraudadas.Nós somos esses computadores que verificam as transações, e somos recompensados por isso com novas moedas, e é assim que somos classificados como mineradores de criptomoedas.");
	 show_message("Agora entrando em uma parte mais técnica, a mineração de criptomoedas é uma atividade que consiste em usar computadores poderosos para resolver problemas matemáticos complexos e validar as transações.");
	 show_message("A mineração é essencial para manter a segurança e a descentralização das redes de criptomoedas, pois evita que alguém possa alterar ou falsificar os registros das transações. E por isso compramos placas de vídeo para aumentar o nosso processamento de dados e assim conseguir verificar mais transações em menos tempo, e assim ganhando mais.");
}
function carrega_dialogo3(_dialogo){
		  
	 show_message("Fazendo um overclock na placa de vídeo conseguimos aumentar nossos ganhos, ele fará a placa sempre usar 110% do seu processamento. Mas isso vai exigir mais energia e isso vai superaquecer as placas. Junte mais dinheiro e compre uma refrigeração que mantenha a temperatura ideal das placas de vídeo.");
}
function carrega_dialogo4(_dialogo){
		  
	 show_message("Agora com uma boa refrigeração não precisamos nos preocupar com o superaquecimento, podemos continuar melhorando nossas ferramentas sem parar, aumentando sempre nosso lucro. A e não se esqueça de contratar os gerentes para automatizar os seus ganhos. ");
}
function carrega_dialogo5(_dialogo){
		  
	 show_message("Agora com uma expansão na nossa fazenda de criptomoedas podemos comprar mais placas de vídeo e aumentar nossos ganhos. Chegamos em um ponto em que estamos usando muita energia e isso diminuirá o nosso lucro, precisamos achar alguma forma de energia sustentável para nos dar menos prejuízos.");
}
function carrega_dialogo6(_dialogo){
		  
	 show_message("Até que enfim uma forma de energia sustentável assim não teremos que pagar rios de dinheiro para companhias elétricas, agora o foco é o progresso novamente e sempre buscar mais dinheiro $$$$.");
}
function carrega_dialogo7(_dialogo){
		  
	 show_message("Com uma IA nos ajudando agora, ela agilizará os processos de escolha de criptomoedas, e escolherá a moeda que recompensará melhor no momento automaticamente além de outras inúmeras tarefas");
}

function carrega_dialogo8(_dialogo){
		  
	 show_message("Quantum Mining uma forma de minerar moedas jamais vista antes a partir de agora chegamos no ápice de tudo, nos tornamos mineradores Rei.");
}

#endregion

//Quando eu apertar enter no iniciar, ele vai rodar um metodo.
//Quando eu apertar enter no opções, ele para o menu de opções.
//Quando eu apertar enter no sair, ele vai fechar o jogo.

//Texto - Ação - Conteudo da ação

//Crian meu menu
menu_principal =	[
						["Iniciar", menu_acoes.roda_metodo, iniciar_jogo],
						["Dialogos desbloqueados", menu_acoes.carrega_menu, menus_lista.dialogos],
						["Deletar progresso", menu_acoes.roda_metodo, deletar_save],
						["Sair", menu_acoes.roda_metodo, sair_jogo]
					];

menu_dialogos=		[
						["Introdução", menu_acoes.roda_metodo, carrega_dialogo],
						["Começar a minerar criptomoedas", menu_acoes.roda_metodo, carrega_dialogo1],
						["Sua primeira placa de video", menu_acoes.roda_metodo, carrega_dialogo2],
						["Aumentar seus ganhos com overclock", menu_acoes.roda_metodo, carrega_dialogo3],
						["Sistema de refrigeração", menu_acoes.roda_metodo, carrega_dialogo4],
						["Expansão na Fazenda", menu_acoes.roda_metodo, carrega_dialogo5],
						["Energia Sustentavel", menu_acoes.roda_metodo, carrega_dialogo6],
						["IA", menu_acoes.roda_metodo, carrega_dialogo7],
						["Quantum Mining", menu_acoes.roda_metodo, carrega_dialogo8],
						["Voltar", menu_acoes.carrega_menu, menus_lista.principal ]
					];



//Salvando todos os meus menus
menus = [menu_principal, menu_dialogos];

//Salvando a seleção de cada menu
menus_sel = array_create(array_length(menus), 0);