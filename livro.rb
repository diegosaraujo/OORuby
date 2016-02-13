class Livro
   attr_reader :titulo, :preco, :ano_lancamento

   def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
         @titulo = titulo
         @ano_lancamento = ano_lancamento
         @possui_reimpressao = possui_reimpressao
         @preco = calcula_preco(preco)
   end

   def to_csv
         "#{@titulo}, #{@ano_lancamento}, #{@preco}"
   end

   def possui_reimpressao?
      @possui_reimpressao
   end

   private

   def calcula_preco(base)
           if @ano_lancamento < 2006
                  if @possui_reimpressao
                      base * 0.9
                  else
                      base * 0.95
                  end
           elsif @ano_lancamento <= 2010
                base * 0.96
            else
                base
            end
      end
end

class Array
      attr_reader :maximo_necessario

      def <<(livro)
            push(livro)
            if @maximo_necessario.nil? || @maximo_necessario < size
               @maximo_necessario = size
            end
            self
      end
end


class Estoque
      attr_reader :livros

      def initialize
            @livros = []
      end

      def exporta_csv
            @livros.each do |livro|
                  puts livro.to_csv
            end
      end

      def mais_baratos_que(valor)
            @livros.select do |livro|
                  livro.preco <= valor
            end
      end

      def total
            @livros.size
      end

      def adiciona(livro)
            @livros << livro if livro
      end
end

estoque = Estoque.new

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
programmer = estoque.adiciona Livro.new("The Pragmatic Programmer", 100, 1999, true)
ruby = estoque.adiciona Livro.new("Programming in Ruby", 100, 2004, true)

estoque.livros << algoritmos << arquitetura
puts estoque.livros.maximo_necessario
estoque.livros << programmer << ruby

estoque.livros.delete algoritmos