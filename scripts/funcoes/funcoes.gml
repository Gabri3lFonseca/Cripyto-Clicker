
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