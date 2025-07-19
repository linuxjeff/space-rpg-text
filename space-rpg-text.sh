#!/usr/bin/env bash
# v0.0.1
# Este é um jogo de RPG em texto.

NOME_DO_PERSONAGEM=""
CLASSE_DO_PERSONAGEM=""


function tela_inicial() {
  OPCAO_TELA_INICIAL="" # Variável para tela inicial.

  while true; do # While da tela inicial.
    clear
    echo -e "SPACE RPG\n       TEXT"
    echo -e "1 - Iniciar\n2 - Sair"
    echo -n ">>> " ; read OPCAO_TELA_INICIAL
    # If para verifiicar conteudo da variável OPCAO_TELA_INICIAL.
    if [[ OPCAO_TELA_INICIAL -eq 2 ]]; then
      break
    elif [[ OPCAO_TELA_INICIAL -eq 1 ]]; then
      tela_personagens
    else
      clear
      echo "Opção invalida!"
      sleep 2
    fi
  done
}


function tela_personagens() {
  PERSONAGEM_ESCOLHIDO=""
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


function tela_nome() {
  NOME_ESCOLHIDO=""
  ESCOLHA=""
  clear
  echo -n "Digite o nome do seu personagem: " ; read NOME_ESCOLHIDO
  clear
  echo "O nome escolhido foi: $NOME_ESCOLHIDO"
  #echo -e "Manter - 1\nTrocar - 2"
  #echo -n ">>> " ; read ESCOLHA
  #if [[ $ESCOLHA -eq 1 ]]; then
  #  NOME_DO_PERSONAGEM=$NOME_ESCOLHIDO
  #elif [[ $ESCOLHA -eq 2 ]]; then
  #  tela_nome
  #else
  #  clear
  #  echo "Opção invalida!"
  #  sleep 2
  #  tela_nome
  #fi
}

tela_inicial
