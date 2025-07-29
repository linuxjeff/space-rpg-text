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
