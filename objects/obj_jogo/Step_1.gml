/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
atualiza_tempo();

//Deixando o jogo mais rapido
if(keyboard_check(vk_space)){
	global.game_spd = 40;
}
else{
	global.game_spd = 1;
}

if(keyboard_check_pressed(ord("S"))){
	save_game();
}

if(keyboard_check(ord("L"))){
	global.money += 10000000;
}

gerencia_produtos();
gerencia_manager();