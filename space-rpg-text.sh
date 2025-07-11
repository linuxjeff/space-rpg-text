#!/usr/bin/env bash
# v0.0.1
# Este é um jogo de RPG em texto.

function tela_inicial() {
  OPCAO_TELA_INICIAL="" # Variável para tela inicial.

  while [[ OPCAO_TELA_INICIAL -ne 2 ]]; do # While da tela inicial.
    echo -e "SPACE RPG\n       TEXT"
    echo -e "1 - Iniciar\n2 - Sair"
    read -i "texto" OPCAO_TELA_INICIAL
    # If para verifiicar conteudo da variável OPCAO_TELA_INICIAL.
    if [ OPCAO_TELA_INICIAL != 1 -o OPCAO_TELA_INICIAL != 2 ]; then
      OPCAO_TELA_INICIAL = ""
      echo "erro"
      sleep 2
    fi
  done
}

tela_inicial
