#!/usr/bin/env bash
# v0.0.1
# Este é um jogo de RPG em texto.

function tela_inicial() {
  OPCAO_TELA_INICIAL="" # Variável para tela inicial.

  while true; do # While da tela inicial.
    clear
    echo -e "SPACE RPG\n       TEXT"
    echo -e "1 - Iniciar\n2 - Sair"
    read OPCAO_TELA_INICIAL
    # If para verifiicar conteudo da variável OPCAO_TELA_INICIAL.
    if [[ OPCAO_TELA_INICIAL -eq 2 ]]; then
      break
    elif [[ OPCAO_TELA_INICIAL -eq 1 ]]; then
      echo "Tela dos personagens."
      sleep 2
      break
    else
      clear
      echo "Opção invalida!"
      sleep 2
    fi
  done
}

function tela_personagens() {
  PERSONAGEM_ESCOLHIDO=""
  while true; do
    echo -e "Classe: Engeiero Classe: Fuzileiro Classe: "
    read PERSONAGEM_ESCOLHIDO
    if [[ PERSONAGEM_ESCOLHIDO -eq 1 ]]; then
      break
    fi
  done
}

tela_personagens
