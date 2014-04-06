#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'

require './StringParser'

class DocParser < Racc::Parser

module_eval(<<'...end DocParser.y/module_eval...', 'DocParser.y', 86)
  def parse(str)
		@sc = DataDocument::StringParser::Scanner.new(str)
    do_parse()
  end

  def next_token()
		@sc.popToken
  end
...end DocParser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    72,    72,     9,    76,     6,    42,    43,    44,     5,    75,
    20,    10,     5,    60,    67,    66,    39,     5,    22,    13,
    24,     5,    28,    29,    30,    31,    73,    73,    48,    49,
    50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
    32,    33,    19,     5,    38,    18,    17,    45,    16,    62,
    64,    65,    15,    69,    14,    74,    13,    77,    78,    79,
    80,    81,     5,    83 ]

racc_action_check = [
    64,    78,     4,    69,     1,    36,    36,    36,    28,    69,
    15,     4,     1,    41,    62,    62,    34,    34,    16,    18,
    19,    20,    21,    22,    24,    25,    64,    78,    41,    41,
    41,    41,    41,    41,    41,    41,    41,    41,    41,    41,
    26,    27,    13,    32,    33,    12,    11,    38,    10,    46,
    47,    61,     9,    63,     6,    68,     5,    70,    71,    72,
    73,    76,     0,    79 ]

racc_action_pointer = [
    54,     4,   nil,   nil,    -3,    54,    54,   nil,   nil,    50,
    46,    37,    35,    31,   nil,     4,     3,   nil,    17,    18,
    13,    16,    21,   nil,    12,    18,    30,    39,     0,   nil,
   nil,   nil,    35,    31,     9,   nil,   -25,   nil,    44,   nil,
   nil,    11,   nil,   nil,   nil,   nil,    36,    39,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    35,    12,    45,    -3,   nil,   nil,   nil,    53,     0,
    45,    48,    30,    57,   nil,   nil,    52,   nil,    -2,    60,
   nil,   nil,   nil,   nil ]

racc_action_default = [
    -6,    -6,    -1,    -2,   -51,   -51,   -51,    -3,    -4,   -51,
   -51,   -51,    -8,   -51,    84,   -51,   -15,    -7,   -51,   -51,
    -6,   -51,   -51,    -9,   -51,   -51,   -11,   -51,    -6,   -16,
   -10,    -5,    -6,   -51,    -6,   -17,   -51,   -12,   -51,   -14,
   -18,   -51,   -48,   -49,   -50,   -13,   -45,   -34,   -21,   -22,
   -23,   -24,   -25,   -26,   -27,   -28,   -29,   -30,   -31,   -32,
   -33,   -51,   -51,   -42,   -51,   -19,   -46,   -47,   -51,   -51,
   -51,   -36,   -41,   -51,   -20,   -43,   -51,   -35,   -51,   -39,
   -40,   -44,   -37,   -38 ]

racc_goto_table = [
    70,    27,    35,    11,    46,    25,     3,     8,    40,    36,
     2,     7,    21,    27,    82,    36,    23,    37,    41,    34,
    61,    47,    63,    68,     1 ]

racc_goto_check = [
    18,     4,    11,     6,    13,     5,     3,     3,    11,     4,
     2,     2,     9,     4,    18,     4,     6,     5,    12,    10,
    14,    15,    16,    17,     1 ]

racc_goto_pointer = [
   nil,    24,    10,     6,   -19,   -15,    -2,   nil,   nil,    -4,
    -9,   -26,   -18,   -37,   -26,   -20,   -25,   -40,   -64,   nil ]

racc_goto_default = [
   nil,   nil,   nil,   nil,     4,   nil,   nil,    12,    26,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    71 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 34, :_reduce_none,
  1, 34, :_reduce_none,
  2, 34, :_reduce_none,
  2, 34, :_reduce_none,
  6, 35, :_reduce_5,
  0, 37, :_reduce_6,
  3, 37, :_reduce_7,
  1, 39, :_reduce_8,
  3, 39, :_reduce_9,
  4, 40, :_reduce_10,
  1, 38, :_reduce_11,
  3, 38, :_reduce_12,
  4, 41, :_reduce_13,
  7, 36, :_reduce_14,
  0, 42, :_reduce_15,
  2, 42, :_reduce_16,
  1, 43, :_reduce_17,
  2, 43, :_reduce_18,
  5, 44, :_reduce_19,
  4, 46, :_reduce_20,
  1, 48, :_reduce_21,
  1, 48, :_reduce_22,
  1, 48, :_reduce_23,
  1, 48, :_reduce_24,
  1, 48, :_reduce_25,
  1, 48, :_reduce_26,
  1, 48, :_reduce_27,
  1, 48, :_reduce_28,
  1, 48, :_reduce_29,
  1, 48, :_reduce_30,
  1, 48, :_reduce_31,
  1, 48, :_reduce_32,
  1, 48, :_reduce_33,
  0, 49, :_reduce_34,
  3, 49, :_reduce_35,
  1, 51, :_reduce_36,
  3, 51, :_reduce_37,
  3, 52, :_reduce_38,
  2, 52, :_reduce_39,
  2, 52, :_reduce_40,
  1, 52, :_reduce_41,
  0, 50, :_reduce_42,
  2, 50, :_reduce_43,
  3, 50, :_reduce_44,
  0, 47, :_reduce_45,
  2, 47, :_reduce_46,
  2, 47, :_reduce_47,
  1, 45, :_reduce_48,
  1, 45, :_reduce_49,
  1, 45, :_reduce_50 ]

racc_reduce_n = 51

racc_shift_n = 84

racc_token_table = {
  false => 0,
  :error => 1,
  :NAME => 2,
  :NUMBER => 3,
  :ATTRIBUTE => 4,
  "enum" => 5,
  "{" => 6,
  "}" => 7,
  "[" => 8,
  "]" => 9,
  "," => 10,
  "(" => 11,
  ")" => 12,
  "=" => 13,
  "struct" => 14,
  ":" => 15,
  ";" => 16,
  "int64" => 17,
  "int32" => 18,
  "int16" => 19,
  "int8" => 20,
  "uint64" => 21,
  "uint32" => 22,
  "uint16" => 23,
  "uint8" => 24,
  "bool" => 25,
  "float" => 26,
  "double" => 27,
  "string" => 28,
  ".." => 29,
  "required" => 30,
  "optional" => 31,
  "reserved" => 32 }

racc_nt_base = 33

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "NAME",
  "NUMBER",
  "ATTRIBUTE",
  "\"enum\"",
  "\"{\"",
  "\"}\"",
  "\"[\"",
  "\"]\"",
  "\",\"",
  "\"(\"",
  "\")\"",
  "\"=\"",
  "\"struct\"",
  "\":\"",
  "\";\"",
  "\"int64\"",
  "\"int32\"",
  "\"int16\"",
  "\"int8\"",
  "\"uint64\"",
  "\"uint32\"",
  "\"uint16\"",
  "\"uint8\"",
  "\"bool\"",
  "\"float\"",
  "\"double\"",
  "\"string\"",
  "\"..\"",
  "\"required\"",
  "\"optional\"",
  "\"reserved\"",
  "$start",
  "expr",
  "enum",
  "struct",
  "attribute",
  "enum_decl",
  "attr_decl",
  "each_attr_decl",
  "each_enum_decl",
  "base_struct",
  "struct_decl",
  "each_struct_decl",
  "data_option",
  "data_define",
  "default_value_define",
  "type_define",
  "condition_define",
  "array_define",
  "condition_decl",
  "each_condition_decl" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

module_eval(<<'.,.,', 'DocParser.y', 12)
  def _reduce_5(val, _values, result)
     result = DataDocument::ParseResult::Enum.new(val[0], val[2], val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 14)
  def _reduce_6(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 15)
  def _reduce_7(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 17)
  def _reduce_8(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 18)
  def _reduce_9(val, _values, result)
     val[2].insert(0, val[0]); result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 20)
  def _reduce_10(val, _values, result)
     result = val[0] + '=' + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 22)
  def _reduce_11(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 23)
  def _reduce_12(val, _values, result)
     val[2].insert(0, val[0]); result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 26)
  def _reduce_13(val, _values, result)
     result = DataDocument::ParseResult::EnumElement.new(val[0], val[1], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 29)
  def _reduce_14(val, _values, result)
     result = DataDocument::ParseResult::Struct.new(val[0], val[2], val[3], val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 31)
  def _reduce_15(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 32)
  def _reduce_16(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 34)
  def _reduce_17(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 35)
  def _reduce_18(val, _values, result)
     val[0].push(val[1]); result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 38)
  def _reduce_19(val, _values, result)
     result = DataDocument::ParseResult::StructElement.new(val[0], val[1], val[2][0], val[2][1], val[2][2], val[2][3], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 41)
  def _reduce_20(val, _values, result)
     result = [val[0], val[1], val[2], val[3]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 43)
  def _reduce_21(val, _values, result)
     result = DataDocument::ParseResult::DataType::INT64 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 44)
  def _reduce_22(val, _values, result)
     result = DataDocument::ParseResult::DataType::INT32 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 45)
  def _reduce_23(val, _values, result)
     result = DataDocument::ParseResult::DataType::INT16 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 46)
  def _reduce_24(val, _values, result)
     result = DataDocument::ParseResult::DataType::INT8 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 47)
  def _reduce_25(val, _values, result)
     result = DataDocument::ParseResult::DataType::UINT64 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 48)
  def _reduce_26(val, _values, result)
     result = DataDocument::ParseResult::DataType::UINT32 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 49)
  def _reduce_27(val, _values, result)
     result = DataDocument::ParseResult::DataType::UINT16 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 50)
  def _reduce_28(val, _values, result)
     result = DataDocument::ParseResult::DataType::UINT8 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 51)
  def _reduce_29(val, _values, result)
     result = DataDocument::ParseResult::DataType::BOOL 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 52)
  def _reduce_30(val, _values, result)
     result = DataDocument::ParseResult::DataType::FLOAT 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 53)
  def _reduce_31(val, _values, result)
     result = DataDocument::ParseResult::DataType::DOUBLE 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 54)
  def _reduce_32(val, _values, result)
     result = DataDocument::ParseResult::DataType::STRING 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 55)
  def _reduce_33(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 57)
  def _reduce_34(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 58)
  def _reduce_35(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 60)
  def _reduce_36(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 61)
  def _reduce_37(val, _values, result)
     val[2].insert(0, val[0]); result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 63)
  def _reduce_38(val, _values, result)
     result = val[0].to_s + '..' + val[2].to_s 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 64)
  def _reduce_39(val, _values, result)
     result = val[0].to_s + '..Max' 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 65)
  def _reduce_40(val, _values, result)
     result = '0..' + val[1].to_s 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 66)
  def _reduce_41(val, _values, result)
     result = val[0].to_s + '..' + val[0].to_s 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 68)
  def _reduce_42(val, _values, result)
     result = 1 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 69)
  def _reduce_43(val, _values, result)
     result = -1 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 70)
  def _reduce_44(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 72)
  def _reduce_45(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 73)
  def _reduce_46(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 74)
  def _reduce_47(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 76)
  def _reduce_48(val, _values, result)
     result = DataDocument::ParseResult::OptionType::REQUIRED 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 77)
  def _reduce_49(val, _values, result)
     result = DataDocument::ParseResult::OptionType::OPTIONAL 
    result
  end
.,.,

module_eval(<<'.,.,', 'DocParser.y', 78)
  def _reduce_50(val, _values, result)
     result = DataDocument::ParseResult::OptionType::RESERVED 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class DocParser
