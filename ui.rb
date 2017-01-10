def avisa_chute_repetido
	puts "Letra já informada!"
end

def avisa_letra_nao_encontrada
	puts "Letra não encontrada!"
end

def avisa_letra_encontrada total_encontrado
	puts "Letra encontrada #{total_encontrado} vezes!"
end

def avisa_acertou_palavra
	puts "Parabéns você acertou a palavra."	
end

def avisa_errou_palavra
	puts "Que pena... errou!"
end

def avisa_pontos_ate_agora pontos_ate_agora
	puts "Você ganhou #{pontos_ate_agora} pontos"
end

def da_boas_vindas
	puts "Bem vindo ao jogoda forca"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n\n"
	puts "Começaremos o jogo para você #{nome}"
	puts "\n\n"
	nome
end

def sorteia_palavra_secreta
	puts "Sorteando uma palavra secreta..."
	palavra_secreta = "programador"
	puts "Escolhida uma palavra com #{palavra_secreta.size} letras... Boa sorte!"
	palavra_secreta
end

def nao_quero_jogar?
	puts "Deseja jogar novamente?"
	quer_jogar = gets.strip
	quer_jogar.upcase == "N"
end

def pede_um_chute
	puts "Entre com a letra ou palavra"
	chute = gets.strip
	puts "Sera que você acertou? Você chutou #{chute}"
	chute
end

def cabecalho_de_tentativas chutes, erros, mascara
	puts "\n\n"
	puts "Erros até agora: #{erros}"
	puts "Chutes até agora: #{chutes}"
	puts "Palavra Secreta: #{mascara}"
end

def mascara_palavra_secreta palavra_secreta, chutes
	mascara = ""
	for letra in palavra_secreta.chars
		if chutes.include? letra
			mascara << letra
		else
			mascara << "_"
		end
	end
	mascara
end