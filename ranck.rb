def salva_rack(nome, pontos)
	conteudo = "#{nome}\n#{pontos}"
	File.write("ranck.txt",conteudo)
end

def le_ranck
	conteudo_atual = File.read("ranck.txt")
	dados = conteudo_atual.split("\n")	
end