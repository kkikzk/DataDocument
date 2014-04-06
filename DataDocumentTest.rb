require 'test/unit'
require './ParseResult'
require './StringParser'
require './DocParser'

class ScannerTest < Test::Unit::TestCase
  include DataDocument
  include StringParser

  def testEmptyString
    # act
    sc = Scanner.new('')

    # assert
    assert_equal([false, false], sc.popToken)
  end

  def testContinuousKeyword
    # act
    sc = Scanner.new(',A;B{')

    # assert
    assert_equal([',', ','], sc.popToken)
    assert_equal([:NAME, 'A'], sc.popToken)
    assert_equal([';', ';'], sc.popToken)
    assert_equal([:NAME, 'B'], sc.popToken)
    assert_equal(['{', '{'], sc.popToken)
    assert_equal([false, false], sc.popToken)
  end

  def testKeyword
    str = ''
    keyword = []

    # arrange
    keyword += Scanner::SYMBOL
    keyword += Scanner::KEYWORD
    keyword.each{|value|
      str += value + ' '
    }

    # act
    sc = Scanner.new(str)

    # assert
    keyword.each{|value|
      assert_equal([value, value], sc.popToken)
    }
    assert_equal([false, false], sc.popToken)
  end

  def testLiteral
    # act
    sc = Scanner.new('0')

    # assert
    assert_equal([:NUMBER, 0], sc.popToken)
    assert_equal([false, false], sc.popToken)
  end

  def testComment
    # act
    sc = Scanner.new(<<-"EOS")
      A//B
      C/*D
      E*/F
      G//H
    EOS

    # assert
    assert_equal([:NAME, 'A'], sc.popToken)
    assert_equal([:NAME, 'C'], sc.popToken)
    assert_equal([:NAME, 'F'], sc.popToken)
    assert_equal([:NAME, 'G'], sc.popToken)
    assert_equal([false, false], sc.popToken)
  end
end

class DocParserTest < Test::Unit::TestCase
  include DataDocument
  include ParseResult

  def teardown
    ParseResult.clear()
  end
  
  def testEnumDefine
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      enum Aaa {
        Bbb = 1
      }
      enum Ccc {
        Ddd = 2,
        Eee = 3
      }
    EOS

    # assert
    assert_equal(2, Enum.definitionCount)

    assert_equal('Aaa', Enum.definition(0).name)
    assert_equal(1, Enum.definition(0).element.length)
    assert_equal('Bbb', Enum.definition(0).element[0].name)
    assert_equal(1, Enum.definition(0).element[0].value)

    assert_equal('Ccc', Enum.definition(1).name)
    assert_equal(2, Enum.definition(1).element.length)
    assert_equal('Ddd', Enum.definition(1).element[0].name)
    assert_equal(2, Enum.definition(1).element[0].value)
    assert_equal('Eee', Enum.definition(1).element[1].name)
    assert_equal(3, Enum.definition(1).element[1].value)
  end
  
  def testStructName
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      struct Data {
        required int32 Number;
      }
    EOS

    # assert
    assert_equal('Data', Struct.definition(0).name)
  end

  def testStructElementOption
    # arrange
    ds = DocParser.new()
    elements = 'struct Data{'
    OptionType.allNames().each{|optionType|
      elements += "#{optionType} int32 Number;"
    }
    elements += '}'

    # act
    ds.parse(elements)

    # assert
    index = 0
    OptionType.all().each{|optionType|
      assert_equal(optionType, Struct.definition(0).element[index].option)
      index += 1
    }
  end

  def testStructElementType
    # arrange
    ds = DocParser.new()
    elements = 'struct Data{'
    DataType.allNames().each{|dataType|
      elements += "required #{dataType} Number;"
    }
    elements += '}'

    # act
    ds.parse(elements)

    # assert
    index = 0
    DataType.all().each{|dataType|
      assert_equal(dataType, Struct.definition(0).element[index].dataType)
      index += 1
    }
  end

  def testStructElementName
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      struct Data {
        required int32 Number;
      }
    EOS

    # assert
    assert_equal('Number', Struct.definition(0).element[0].name)
  end

  def testStructElementDefaultValue
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      struct Data {
        required float Number = 2.1;
        required int32 Number2 = 2;
      }
    EOS

    # assert
    assert_equal(2.1, Struct.definition(0).element[0].defaultValue)
    assert_equal(2, Struct.definition(0).element[1].defaultValue)
  end

  def testStructArrayElement
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      struct Data {
        required int32 Number = 2;
        required int32[] ValArray;
        required int32[5] FixedArray = 1;
      }
    EOS

    # assert
    assert_equal(1, Struct.definition(0).element[0].count)
    assert_equal(-1, Struct.definition(0).element[1].count)
    assert_equal(5, Struct.definition(0).element[2].count)
  end

  def testStructElementCondition
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      struct Data {
        required int32(1) Number;
        required string(1.2..5.4) Number;
        required int32(..5) Number;
        required int32(10..15)[] Number;
        required int8(..2, 10..15, 20, 25..)[2] Number;
      }
    EOS

    # assert
    assert_equal(['1..1'], Struct.definition(0).element[0].condition)
    assert_equal(['1.2..5.4'], Struct.definition(0).element[1].condition)
    assert_equal(['0..5'], Struct.definition(0).element[2].condition)
    assert_equal(['10..15'], Struct.definition(0).element[3].condition)
    assert_equal(['0..2', '10..15', '20..20', '25..Max'],
      Struct.definition(0).element[4].condition)
  end

  def testDerivedStruct
    # arrange
    ds = DocParser.new()

    # act
    ds.parse(<<-"EOS")
      struct Base {
        required int32 BaseNumber;
      }
      struct Data : Base {
        required int32 Number;
      }
    EOS

    # assert
    assert_equal('Base', Struct.definition(1).baseType)
  end

  def test
    # arrange
    ds = DocParser.new()

    #act
    ds.parse(<<-"EOS")
      [attr_name(LangType), attr_desc(AppLanguage)]
      enum LanguageType {
        [attr_desc(Default)]
        Japanese = 1,
        English = 2
      }
      [attr_name(Header)]
      struct CommonHeader {
        [attr_desc(NewestVersion)]
        required int32 Version = 1;
        required LanguageType Language = LanguageType.Japanese;
        reserved int32[2] ReservedValue = 0;
      }
      struct HogeData {
        required string Name;
        required int32(1..10) Count = 1;
        required bool IsClient = true;
        required uint32[] RawData;
      }
      struct Hoge {
        required CommonHeader Header;
        required HogeData Data;
      }
    EOS

    #assert
    assert_equal(1, Enum.definitionCount)
    assert_equal('LangType', Enum.definition(0).attribute("attr_name"))
    assert_equal('AppLanguage', Enum.definition(0).attribute("attr_desc"))
    assert_equal('LanguageType', Enum.definition(0).name)
    assert_equal(2, Enum.definition(0).element.length)
    assert_equal('Default', Enum.definition(0).element[0].attribute("attr_desc"))
    assert_equal('Japanese', Enum.definition(0).element[0].name)
    assert_equal(1, Enum.definition(0).element[0].value)
    assert_equal('English', Enum.definition(0).element[1].name)
    assert_equal(2, Enum.definition(0).element[1].value)
    
    assert_equal(3, Struct.definitionCount)
    assert_equal('Header', Struct.definition(0).attribute("attr_name"))
    assert_equal('CommonHeader', Struct.definition(0).name)
    assert_equal(3, Struct.definition(0).element.length)
    assert_equal('NewestVersion', Struct.definition(0).element[0].attribute("attr_desc"))
    assert_equal(OptionType::REQUIRED, Struct.definition(0).element[0].option)
    assert_equal(DataType::INT32, Struct.definition(0).element[0].dataType)
    assert_equal(nil, Struct.definition(0).element[0].condition)
    assert_equal(1, Struct.definition(0).element[0].count)
    assert_equal('Version', Struct.definition(0).element[0].name)
    assert_equal(1, Struct.definition(0).element[0].defaultValue)
    assert_equal(OptionType::REQUIRED, Struct.definition(0).element[1].option)
    assert_equal('LanguageType', Struct.definition(0).element[1].dataType)
    assert_equal(nil, Struct.definition(0).element[1].condition)
    assert_equal(1, Struct.definition(0).element[1].count)
    assert_equal('Language', Struct.definition(0).element[1].name)
    assert_equal('LanguageType.Japanese', Struct.definition(0).element[1].defaultValue)
    assert_equal(OptionType::RESERVED, Struct.definition(0).element[2].option)
    assert_equal(DataType::INT32, Struct.definition(0).element[2].dataType)
    assert_equal(nil, Struct.definition(0).element[2].condition)
    assert_equal(2, Struct.definition(0).element[2].count)
    assert_equal('ReservedValue', Struct.definition(0).element[2].name)
    assert_equal(0, Struct.definition(0).element[2].defaultValue)
    
    assert_equal('HogeData', Struct.definition(1).name)
    assert_equal(4, Struct.definition(1).element.length)
    assert_equal(OptionType::REQUIRED, Struct.definition(1).element[0].option)
    assert_equal(DataType::STRING, Struct.definition(1).element[0].dataType)
    assert_equal(nil, Struct.definition(1).element[0].condition)
    assert_equal(1, Struct.definition(1).element[0].count)
    assert_equal('Name', Struct.definition(1).element[0].name)
    assert_equal(nil, Struct.definition(1).element[0].defaultValue)
    
    assert_equal(OptionType::REQUIRED, Struct.definition(1).element[1].option)
    assert_equal(DataType::INT32, Struct.definition(1).element[1].dataType)
    assert_equal(['1..10'], Struct.definition(1).element[1].condition)
    assert_equal(1, Struct.definition(1).element[1].count)
    assert_equal('Count', Struct.definition(1).element[1].name)
    assert_equal(1, Struct.definition(1).element[1].defaultValue)
    
    assert_equal(OptionType::REQUIRED, Struct.definition(1).element[2].option)
    assert_equal(DataType::BOOL, Struct.definition(1).element[2].dataType)
    assert_equal(nil, Struct.definition(1).element[2].condition)
    assert_equal(1, Struct.definition(1).element[2].count)
    assert_equal('IsClient', Struct.definition(1).element[2].name)
    assert_equal('true', Struct.definition(1).element[2].defaultValue)
    
    assert_equal(OptionType::REQUIRED, Struct.definition(1).element[3].option)
    assert_equal(DataType::UINT32, Struct.definition(1).element[3].dataType)
    assert_equal(nil, Struct.definition(1).element[3].condition)
    assert_equal(-1, Struct.definition(1).element[3].count)
    assert_equal('RawData', Struct.definition(1).element[3].name)
    assert_equal(nil, Struct.definition(1).element[3].defaultValue)
    
    assert_equal('Hoge', Struct.definition(2).name)
    assert_equal(2, Struct.definition(2).element.length)
    assert_equal(OptionType::REQUIRED, Struct.definition(2).element[0].option)
    assert_equal('CommonHeader', Struct.definition(2).element[0].dataType)
    assert_equal(nil, Struct.definition(2).element[0].condition)
    assert_equal(1, Struct.definition(2).element[0].count)
    assert_equal('Header', Struct.definition(2).element[0].name)
    assert_equal(nil, Struct.definition(2).element[0].defaultValue)
    
    assert_equal(OptionType::REQUIRED, Struct.definition(2).element[1].option)
    assert_equal('HogeData', Struct.definition(2).element[1].dataType)
    assert_equal(nil, Struct.definition(2).element[1].condition)
    assert_equal(1, Struct.definition(2).element[1].count)
    assert_equal('Data', Struct.definition(2).element[1].name)
    assert_equal(nil, Struct.definition(2).element[1].defaultValue)
  end
end