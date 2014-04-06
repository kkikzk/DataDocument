class DocParser
	token NAME
	token NUMBER
	token ATTRIBUTE

rule
	expr: enum
			| struct
			| expr enum
			| expr struct

	enum: attribute 'enum' NAME '{' enum_decl '}'
		{ result = DataDocument::ParseResult::Enum.new(val[0], val[2], val[4]) }

	attribute: { result = [] }
					 | '[' attr_decl ']' { result = val[1] }

	attr_decl : each_attr_decl { result = [val[0]] }
						| each_attr_decl ',' attr_decl { val[2].insert(0, val[0]); result = val[2] }

	each_attr_decl: NAME '(' NAME ')' { result = val[0] + '=' + val[2] }

	enum_decl: each_enum_decl { result = [val[0]] }
					 | each_enum_decl ',' enum_decl  { val[2].insert(0, val[0]); result = val[2] }

	each_enum_decl: attribute NAME '=' NUMBER
		{ result = DataDocument::ParseResult::EnumElement.new(val[0], val[1], val[3]) }

	struct: attribute 'struct' NAME base_struct '{' struct_decl '}'
		{ result = DataDocument::ParseResult::Struct.new(val[0], val[2], val[3], val[5]) }

	base_struct: { result = nil }
						 | ':' NAME { result = val[1] }

	struct_decl: each_struct_decl { result = [val[0]] }
						 | struct_decl each_struct_decl { val[0].push(val[1]); result = val[0] }

	each_struct_decl: attribute data_option data_define default_value_define ';'
		{ result = DataDocument::ParseResult::StructElement.new(val[0], val[1], val[2][0], val[2][1], val[2][2], val[2][3], val[3]) }
	
	data_define: type_define condition_define array_define NAME
		{ result = [val[0], val[1], val[2], val[3]] }
	
	type_define: 'int64' { result = DataDocument::ParseResult::DataType::INT64 }
						 | 'int32' { result = DataDocument::ParseResult::DataType::INT32 }
						 | 'int16' { result = DataDocument::ParseResult::DataType::INT16 }
						 | 'int8' { result = DataDocument::ParseResult::DataType::INT8 }
						 | 'uint64' { result = DataDocument::ParseResult::DataType::UINT64 }
						 | 'uint32' { result = DataDocument::ParseResult::DataType::UINT32 }
						 | 'uint16' { result = DataDocument::ParseResult::DataType::UINT16 }
						 | 'uint8' { result = DataDocument::ParseResult::DataType::UINT8 }
						 | 'bool' { result = DataDocument::ParseResult::DataType::BOOL }
						 | 'float' { result = DataDocument::ParseResult::DataType::FLOAT }
						 | 'double' { result = DataDocument::ParseResult::DataType::DOUBLE }
						 | 'string' { result = DataDocument::ParseResult::DataType::STRING }
						 | NAME { result = val[0] }
	
	condition_define: { result = nil }
									| '(' condition_decl ')' { result = val[1] }
	
	condition_decl: each_condition_decl { result = [val[0]] }
								| each_condition_decl ',' condition_decl { val[2].insert(0, val[0]); result = val[2] }
	
	each_condition_decl: NUMBER '..' NUMBER { result = val[0].to_s + '..' + val[2].to_s }
										 | NUMBER '..' { result = val[0].to_s + '..Max' }
										 | '..' NUMBER { result = '0..' + val[1].to_s }
										 | NUMBER { result = val[0].to_s + '..' + val[0].to_s }
	
	array_define: { result = 1 }
		 					| '[' ']' { result = -1 }
							| '[' NUMBER ']' { result = val[1] }
	
	default_value_define: { result = nil }
											| '=' NUMBER { result = val[1] }
											| '=' NAME { result = val[1] }
	
	data_option: 'required' { result = DataDocument::ParseResult::OptionType::REQUIRED }
						 | 'optional' { result = DataDocument::ParseResult::OptionType::OPTIONAL }
						 | 'reserved' { result = DataDocument::ParseResult::OptionType::RESERVED }
end

---- header
require './StringParser'

---- inner
  def parse(str)
		@sc = DataDocument::StringParser::Scanner.new(str)
    do_parse()
  end

  def next_token()
		@sc.popToken
  end