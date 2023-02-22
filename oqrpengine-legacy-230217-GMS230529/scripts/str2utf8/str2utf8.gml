function str2utf8(value){
		_strbuild = "";
		
		for (i = 0; i < string_length(value); i++) {
			_strbuild += string(ord("~"))
			_strbuild += string(ord(string_char_at(value, i)))
		}
		_strbuild += string(ord("~"))
		
		return real(_strbuild);
	
	
}

function str2utf8_undecodable(value) {
			_strbuild = "";
		
			_strbuild += string(ord("~"))
		for (i = 0; i < string_length(value); i++) {
			_strbuild += string(ord(string_char_at(value, i)))
		}
		_strbuild += string(ord("~"))
		
		return real(_strbuild);
	
	
}

function str2utf8_undecodable_add(value) {
			_strbuild = 0;
		
		for (i = 0; i < string_length(value); i++) {
			_strbuild += ord(string_char_at(value, i))
		}
		
		return _strbuild;
	
	
}