require "./token"
require "./scanner"
require "./parser"
# require "./interpreter"

module Cobalt
    class Runner
        @@had_error = false
        @@had_runtime_error = false
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
    
        def self.runtime_error(error)
            puts "#{error.message}\n[line #{error.token.line}]"
            @@had_runtime_error = true
        end
    end
end