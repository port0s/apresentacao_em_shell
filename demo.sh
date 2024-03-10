# declaração da cor verde, normal, amarelo, cyano
declare Verd=$(tput setaf 2; tput bold) Norm=$(tput sgr0) Amar=$(tput setaf 3; tput bold) Cyan=$(tput setaf 6; tput bold)

# Caso não haja parâmetro, faça o que a frase diz
${1?Passe como parâmetro o nome da Demo que vc deseja}

Func=$1.func # Nome do arquivo de funções com as instruções

# Testa se exite o arquivo cuja extensão é .func
[[ -f $Func ]] || {
	echo Parâmetro errado. Não existe arquivo de funções $Func
	exit 1
}

# Carrega o arquivo cuja extensão é .func
source $Func

# Executa a função do arquivo cuja extensão é .func
Textos
clear

# Pega cada frase do texto
for Frase in "${Frases[@]}"
do
	# Se a frase estiver vazia, continue
	[[ -z $Frase ]] && {
		echo
		continue
	}
	# Se o primeiro caractere da frase for "#", faça amarelo, frase e normal
	[[ "${Frase:0:1}" == \# ]] && {
		echo $Amar"$Frase"$Norm
		continue
	}

	# Exiba na gtela a frase
	read -p "$Cyan$Frase$Norm"

	# Tira o cifrão e executa
	eval ${Frase:2}
done
