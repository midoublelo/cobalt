require "./token"

module Cobalt
    class Scanner
        @@keywords = {
        and:    TokenType::AND,
        class:  TokenType::CLASS,
        else:   TokenType::ELSE,
        end:    TokenType::END,
        false:  TokenType::FALSE,
        fn:     TokenType::FN,
        for:    TokenType::FOR,
        if:     TokenType::IF,
        nil:    TokenType::NIL,
        or:     TokenType::OR,
        return: TokenType::RETURN,
        this:   TokenType::THIS,
        true:   TokenType::TRUE,
        val:    TokenType::VAL,
        while:  TokenType::WHILE,
        }
    end

    def initialize(source : String)
        @source = source
        @tokens = Array(Token).new
        @start = 0
        @current = 0
        @line = 1
    end

    def scanTokens
        while !at_end?
            @start = @current
            scanToken
        end

        @tokens << Token.new(TokenType::EOF, "", nil, @line)
        @tokens
    end

    def scanToken
        c = advance

        case c
        when '(' then addToken(TokenType::LEFT_PAREN)
        when ')' then addToken(TokenType::RIGHT_PAREN)
        when '{' then addToken(TokenType::LEFT_BRACE)
        when '}' then addToken(TokenType::RIGHT_BRACE)
        when ',' then addToken(TokenType::COMMA)
        when '.' then addToken(TokenType::DOT)
        when '+' then addToken(TokenType::PLUS)
        when ';' then addToken(TokenType::SEMICOLON)
        when '*' then addToken(TokenType::STAR)
        when '-' then addToken(match('>') ? TokenType::ARROW : TokenType::MINUS)
        when '!' then addToken(match('=') ? TokenType::BANG_EQUAL : TokenType::BANG)
        when '=' then addToken(match('=') ? TokenType::EQUAL_EQUAL : TokenType::EQUAL)
        when '<' then addToken(match('=') ? TokenType::LESS_EQUAL : TokenType::LESS)
        when '>' then addToken(match('=') ? TokenType::GREATER_EQUAL : TokenType::GREATER)
        when '/'
        if match('/')
            # A comment goes until the end of the line./
            while peek != '\n' && !at_end?
            advance
            end
        else
            addToken(TokenType::SLASH)
        end
        when ' ', '\r', '\t'
        # Ignore whitespace. Do nothing.
        when '\n' then @line += 1
        when '"'  then string()
        else
        if digit?(c)
            number
        elsif alpha?(c)
            identifier
        else
            Runner.error(@line, "Unexpected character.")
        end
        end
    end

    def string
        until peek == '"' && at_end?
            @line += 1 if peek == '\n'
            advance
        end

        if at_end?
            Runner.error(@line, "Unterminated string.")
            return
        end

        advance
        addToken(TokenType::String, @source[@start + 1...@current - 1])
    end

    def number
        while digit?(peek)
            advance
        end

        if peek == "." && digit?(peekNext)
            advance
            while digit?(peek)
                advance
            end
        end

        addToken(TokenType::NUMBER, @source[@start...@current].to_f)
    end

    def identifier
        while alphaNumeric?(peek)
            advance
        end

        text = @source[@start...@current]
        type = @@keywords.fetch(text) { TokenType::IDENTIFIER }

        addToken(type)
    end

    def advance
        @current += 1
        @source[@current - 1]
    end

    def addToken(type, literal = Nil)
        text = @source[@start...@current]
        @tokens << Token.new(type, text, literal, @line)
    end

    def match(expected)
        return false if at_end? || @source[@current] != expected
        @current += 1
        true
    end

    def peek
        return '\0' if at_end?
        @source[@current]
    end

    def peekNext
        return '\0' if @current + 1 >= @source.size
        @source[@current + 1]
    end

    def at_end?
        @current >= @source.size
    end

    def digit?(c)
        c >= '0' && c <= '9'
    end

    def alpha?(c)
        (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_'
    end

    def alphaNumeric?(c)
        alpha?(c) || digit?(c)
    end
end