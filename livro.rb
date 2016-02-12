class Livro
   attr_reader :titulo, :preco, :ano_lancamento

   def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
         @titulo = titulo
         @ano_lancamento = ano_lancamento
         @possui_reimpressao = possui_reimpressao
         @preco = calcula_preco(preco)
   end

   def possui_reimpressao?
      @possui_reimpressao
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

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
livro_para_newsletter(algoritmos)


