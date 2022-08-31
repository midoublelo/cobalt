require "./token"
require "./scanner"

module Cobalt
    class Runner
        @@had_error = false
        @@had_runtimeError = false
        # @@interpreter = Interpreter.new
    
        def self.report(line, where, message)
            if where.blank?
                puts "[Error] Line #{line}: #{message}"
            else
                puts "[Error] Line #{line}, #{where}: #{message}"
            end
    
            @@had_error = true
        end
    
        def self.error(line : Integer, message)
            report(line, "", message)
        end
    
        def self.error(token : Token, message)
            if (token.type == TokenType::EOF)
                report(token.line, "at end", message)
            else
                report(token.line, "at #{token.lexeme.inspect}", message)
            end
        end
    
        def self.runtimeError(error)
            puts "#{error.message}\n[line #{error.token.line}]"
            @@had_runtimeError = true
        end

        def self.run(source)
            tokens = Scanner.new(source).scanTokens
            puts tokens
            exit 65 if @@had_error
            exit 70 if @@had_runtimeError
        end
    end
end