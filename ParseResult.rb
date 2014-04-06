module DataDocument
  module ParseResult
    module DataType
      def self.allNames
        self.constants.map{|name| name.downcase.to_s}
      end
      def self.all
        self.constants.map{|name| self.const_get(name) }
      end
      INT64 = 1
      INT32 = 2
      INT16 = 3
      INT8 = 4
      UINT64 = 5
      UINT32 = 6
      UINT16 = 7
      UINT8 = 8
      BOOL = 9
      FLOAT = 10
      DOUBLE = 11
      STRING = 12
    end

    module OptionType
      def self.allNames
        self.constants.map{|name| name.downcase.to_s}
      end
      def self.all
        self.constants.map{|name| self.const_get(name) }
      end
      REQUIRED = 1
      OPTIONAL = 2
      RESERVED = 3
    end

    def self.clear
      Struct.clear()
      Enum.clear()
    end

    module AttributeHolder
      def attribute(name)
        temp = name + '='
        @attribute.each{|value|
          if value.start_with?(temp) then
            return value[temp.length..-1]
          end
        }
        return nil
      end
    end
  
    class Enum
      include AttributeHolder
      attr_reader :name, :element
      @@enums = []

      def initialize(attribute, name, element)
        @attribute = attribute
        @name = name
        @element = element
        @@enums << self
      end

      def self.clear
        @@enums.clear
      end

      def self.definitionCount
        @@enums.length
      end

      def self.definition(index)
        @@enums[index]
      end
    end
  
    class EnumElement
      include AttributeHolder
      attr_reader :name, :value

      def initialize(attribute, name, value)
        @attribute = attribute
        @name = name
        @value = value
      end
    end

    class Struct
      include AttributeHolder
      attr_reader :name, :baseType, :element
      @@structs = []

      def initialize(attribute, name, baseType, element)
        @attribute = attribute
        @name = name
        @baseType = baseType
        @element = element
        @@structs << self
      end

      def self.clear
        @@structs.clear
      end

      def self.definitionCount
        @@structs.length
      end

      def self.definition(index)
        @@structs[index]
      end
    end

    class StructElement
      include AttributeHolder
      attr_reader :option, :dataType, :condition, :count, :name, :defaultValue 

      def initialize(attribute, option, dataType, condition, count, name, defaultValue)
        @attribute = attribute
        @option = option
        @dataType = dataType
        @condition = condition
        @count = count
        @name = name
        @defaultValue = defaultValue
      end
    end
  end
end