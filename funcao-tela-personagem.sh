function tela_personagens() {
clear
while true; do
  echo "| ID: 1            | ID: 2             | ID: 3             |"
  echo "| Classe: Engeiero | Classe: Fuzileiro | Classe: Cientista |"
  echo "| Ataque: 8        | Ataque: 10        | Ataque: 6         |"
  echo "| Defesa: 10       | Defesa: 6         | Defesa: 8         |"
  echo "| Velocidade: 6    | Velocidade: 8     | Velocidade: 10    |"
  echo "Digite o ID do personagens ou zero para voltar a tela inicail."
  echo -n ">>> " ; read -t 60 PERSONAGEM_ESCOLHIDO
  if [[ PERSONAGEM_ESCOLHIDO -eq "" ]]; then
    PERSONAGEM_ESCOLHIDO="0"
  fi
  if [[ $PERSONAGEM_ESCOLHIDO -eq 1 || $PERSONAGEM_ESCOLHIDO -eq 2 || $PERSONAGEM_ESCOLHIDO -eq 3 ]]; then
    tela_nome
    CLASSE_DO_PERSONAGEM="$PERSONAGEM_ESCOLHIDO"
    break
  elif [[ PERSONAGEM_ESCOLHIDO -eq "0" ]]; then
    tela_inicial
  else
    clear
    echo "Não a este ID de personagens."
    sleep 3
    clear
  fi
done
}
