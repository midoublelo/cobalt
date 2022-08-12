require "./token"

module Cobalt
    class Scanner 
        @@keywords = {
            and: TokenType::AND,
            class: TokenType::CLASS,
            else: TokenType::ELSE,
            end: TokenType::END,
            false: TokenType::FALSE,
            fn: TokenType::FN,
            for: TokenType::FOR,
            if: TokenType::IF,
            let: TokenType::LET,
            nil: TokenType::NIL,
            or: TokenType::OR,
            return: TokenType::RETURN,
            this: TokenType::THIS,
            true: TokenType::TRUE,
            var: TokenType::VAR,
            while: TokenType::WHILE,
        }
    end

    def initialise(source : String)
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
        if c == '('
            add_token(TokenType::LEFT_PAREN)
        elsif c == ')'
            add_token(TokenType::RIGHT_PAREN)
        elsif c == '{'
            add_token(TokenType::LEFT_BRACE)
        elsif c == '}'
            add_token(TokenType::RIGHT_BRACE)
        elsif c == ','
            add_token(TokenType::COMMA)
        elsif c == '.'
            add_token(TokenType::DOT)
        elsif c == '+'
            add_token(TokenType::PLUS)
        elsif c == '*'
            add_token(TokenType::STAR)
        elsif c == '-'
            if match('>')
                add_token(TokenType::ARROW)
            else
                add_token(TokenType::MINUS)
            end
        elsif c = '/'
            if match('/')
                add_token(TokenType::SLASH_SLASH)
            else
                add_token(TokenType::SLASH)
            end
        elsif c == '='
            if match('=')
                add_token(TokenType::EQUAL_EQUAL)
            elsif match('>')
                add_token(TokenType::FAT_ARROW)
            else
                add_token(TokenType::EQUAL)
            end
        elsif c == '<'
            if match('=')
                add_token(TokenType::LESS_EQUAL)
            else
                add_token(TokenType::LESS)
            end
          elsif c == '>'
            if match('=')
                add_token(TokenType::GREATER_EQUAL)
            else
                add_token(TokenType::GREATER)
            end
        elsif c == ' ' || c == '\r' || c == '\t'
        elsif c == '\n'
          @line += 1
        elsif c == '"'
          string
        elsif digit?(c)
          number
        elsif alpha?(c)
          identifier
        else
          Runner.error(@line, "Found unexpected character #{c}")
        end

        ## Unfinished
    end
end