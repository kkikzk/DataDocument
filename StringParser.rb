module DataDocument
  module StringParser
    class Scanner
      SYMBOL = [
        ',',
        ';',
        '{',
        '}',
        '(',
        ')',
        '=',
        '[',
        ']',
        '..',
        ':',
      ]
      KEYWORD = [
        'enum',
        'struct',
      ]

      attr_reader :originalString, :formattedString, :tokens

      def initialize(str)
        @originalString = str.clone
        @formattedString = Scanner.separateSymbols(Scanner.removeComment(str.clone)).strip
        @tokens = tokenize()
      end

      def self.removeComment(str)
        removeSingleLineComment(removeMultiLineComment(str))
      end

      def self.removeMultiLineComment(str)
        str.gsub(/\/\*.*\*\//m, ' ')
      end

      def self.removeSingleLineComment(str)
        str.gsub(/\/\/.*$/, '')
      end

      def self.separateSymbols(str)
        clonedString = str.clone
        SYMBOL.each{|value| clonedString.gsub!(value, " " + value + " ")}
        return clonedString
      end

      def tokenize
        if @formattedString.length < 1 then
          return []
        end
        @formattedString.split(/[\s]+/)
      end

      def popToken
        token = @tokens.shift()
        case token
        when /^[\d]+[\.]?[\d]*\z/
          return [:NUMBER, (token.include?('.') ? token.to_f : token.to_i)]
        when nil
          return [false, false]
        else
          return [((isReserved?(token.downcase)) ? (token.downcase) : (:NAME)), token]
        end
      end

      def isReserved?(token)
        SYMBOL.include?(token) ||
        KEYWORD.include?(token) ||
        DataDocument::ParseResult::DataType.allNames.include?(token) ||
        DataDocument::ParseResult::OptionType.allNames.include?(token)
      end
    end
  end
end