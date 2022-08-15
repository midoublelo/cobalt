module Cobalt
    alias Integer = Int32
    alias Float = Float64
    alias LiteralType = (String | Float | Bool | Nil)

    enum TokenType
        # Single-character tokens.
        LEFT_PAREN; RIGHT_PAREN; LEFT_BRACKET; RIGHT_BRACKET
        COMMA; DOT; MINUS; PLUS; SLASH; STAR; COLON;

        # One or two character tokens.
        BANG; BANG_EQUAL
        EQUAL; EQUAL_EQUAL
        GREATER; GREATER_EQUAL
        LESS; LESS_EQUAL;
        QUESTION; PIPE;
        BAR; SLASH_SLASH;
        ARROW; FAT_ARROW;

        # Literals.
        IDENTIFIER; STRING; NUMBER

        # Keywords. NOTE: Add pattern matching later
        AND; CLASS; ELSE; END; FALSE; FN; FOR; IF;
        NIL; OR; RETURN; THIS; TRUE; VAL; WHILE

        EOF
    end

    class Token
        property :type, :lexeme, :literal, :line

        def intialise(type : TokenType, lexeme : String, literal : LiteralType, line : Integer)
            @type = type
            @lexeme = lexeme
            @literal = literal
            @line = line
        end

        def to_s
            "#{@type} #{@lexeme} #{@literal}"
        end
    end
end
