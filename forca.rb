require_relative 'ui'
require_relative 'ranck'

def pede_um_chute_valido chutes, erros, mascara
	cabecalho_de_tentativas chutes, erros, mascara
	loop do 
		chute = pede_um_chute
		if chutes.include? chute
			avisa_chute_repetido
		else
			return chute
		end 
	end
end

def sorteia_palavra_secreta
	avisa_escolhendo_palavra
	dicionario = File.read("dicionario.txt")
	todas_as_palavras = dicionario.split("\n")
	numero_aleatorio = rand(todas_as_palavras.size)
	palavra_secreta = todas_as_palavras[numero_aleatorio].downcase
	avisa_palavra_escolhida palavra_secreta
end

def salva_rack(nome, pontos)
	conteudo = "#{nome}\n#{pontos}"
	File.write("ranck.txt",conteudo)
end

def le_ranck
	conteudo_atual = File.read("ranck.txt")
	dados = conteudo_atual.split("\n")	
end

def joga(nome)
	palavra_secreta = sorteia_palavra_secreta

	erros = 0
	chutes = []
	pontos_ate_agora = 0

	while erros < 5
		mascara = mascara_palavra_secreta palavra_secreta, chutes
		chute = pede_um_chute_valido chutes, erros, mascara
		chutes << chute

		chutou_uma_unica_letra = chute.size == 1
		if chutou_uma_unica_letra
			total_encontrado = palavra_secreta.count(chute[0])
			if total_encontrado == 0
				avisa_letra_nao_encontrada
				erros += 1
				pontos_ate_agora -= 30
			else
				avisa_letra_encontrada total_encontrado
			end
		else
			acertou_palavra = chute == palavra_secreta
			if acertou_palavra
				avisa_acertou_palavra
				pontos_ate_agora += 100
				break
			else
				avisa_errou_palavra
				pontos_ate_agora -=30
				erros += 1
			end		
		end
	end

	avisa_pontos_ate_agora pontos_ate_agora
	pontos_ate_agora
end

def jogo_da_forca
	nome = da_boas_vindas
	pontos_totais = 0

	avisa_campeao_atual le_ranck

	loop do
		pontos_totais += joga nome
		avisa_pontos_totais pontos_totais
		salva_rack nome, pontos_totais

		if le_ranck[1].to_i < pontos_totais
			salva_rack nome, pontos_totais
		end

		break if nao_quero_jogar?
	end
end

jogo_da_forca