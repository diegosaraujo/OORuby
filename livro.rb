class Livro
   attr_reader :titulo, :preco, :ano_lancamento

   def initialize(titulo, preco, ano_lancamento)
         @titulo = titulo
         @ano_lancamento = ano_lancamento
         @preco = calcula_preco(preco)

   end
   private

   def calcula_preco(base)
            if @ano_lancamento < 2000
               base * 0.7
            else
               base
            end
      end
end

def livro_para_newsletter(livro)
      if livro.ano_lancamento < 1999
         puts "NewsLetter /Liquidação"
         puts livro.titulo
         puts livro.preco
   end
end

algoritmos = Livro.new("Algoritmos", 100, 1998)
#ruby = Livro.new("Ruby", 100, 2001)
livro_para_newsletter(algoritmos)


# def lista_livros(livros)
#       livros.each do |livro|
#          puts "Livro: #{livro.titulo} - Preço: #{livro.preco} - Data de Publicação: #{livro.ano_lancamento}"
#       end
# end

# livros = [algoritmos, ruby]
# lista_livros livros