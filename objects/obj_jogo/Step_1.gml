/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
atualiza_tempo();

//Deixando o jogo mais rapido
if(keyboard_check(vk_space)){
	global.game_spd = 40;
}
if(keyboard_check(vk_alt)){
	global.money += 100000008;
}
else{
	global.game_spd = 1;
}

if(keyboard_check_pressed(ord("S"))){
	save_game();
}


gerencia_produtos();
gerencia_manager();