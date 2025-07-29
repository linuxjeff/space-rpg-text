#!/usr/bin/env bash
# v0.0.1
# Este é um jogo de RPG em texto.

NOME_DO_PERSONAGEM=""
CLASSE_DO_PERSONAGEM=""


function tela_inicial() {
  OPCAO_TELA_INICIAL="" # Variável para tela inicial.

  clear

  echo -e "SPACE RPG\n       TEXT"
  echo -e "1 - Iniciar\n2 - Sair"
  echo -n ">>> " ; read OPCAO_TELA_INICIAL

  OPCAO_TELA_INICIAL="${OPCAO_TELA_INICIAL^^}"

  case $OPCAO_TELA_INICIAL in
    1 | "I" | "INICIAR" )
    tela_personagens
      ;;
    2 | "S" | "SAIR" )
    exit 0
      ;;
    * )
    clear
    echo "Opção invalida!"
    sleep 2
    tela_inicial
      ;;
  esac
}


function tela_personagens() {
  clear

  echo "| ID: 1            | ID: 2             | ID: 3             |"
  echo "| Classe: Engeiero | Classe: Fuzileiro | Classe: Cientista |"
  echo "| Ataque: 8        | Ataque: 10        | Ataque: 6         |"
  echo "| Defesa: 10       | Defesa: 6         | Defesa: 8         |"
  echo "| Velocidade: 6    | Velocidade: 8     | Velocidade: 10    |"
  echo "Digite o ID do personagens ou (S)air para voltar a tela inicail."
  echo -n ">>> " ; read PERSONAGEM_ESCOLHIDO

  PERSONAGEM_ESCOLHIDO="${PERSONAGEM_ESCOLHIDO^^}"

  case $PERSONAGEM_ESCOLHIDO in
    1 | 2 | 3)
    CLASSE_DO_PERSONAGEM=$PERSONAGEM_ESCOLHIDO
    tela_nome
      ;;
  "S" )
    tela_inicial
      ;;
    * )
    clear
    echo "Não a este ID de personagens."
    sleep 3
    clear
    tela_personagens
esac

}


function tela_nome() {
  NOME_ESCOLHIDO=""
  ESCOLHA=""
  clear
  read -p "Digite o nome do seu personagem: " NOME_ESCOLHIDO
  clear
  echo "O nome escolhido foi: $NOME_ESCOLHIDO"
  sleep 5

  tela_da_sinopse
}


function tela_da_sinopse() {

  clear

  echo -e "
   Você entrou na atmosfera de Aurora no sistema estelar de Vanini. Em alguns
   segundos a sua nave começa a dar vários alarmes de panes em alguns sistemas
   críticos, o  pouso controlado da nave se torna impossível, mas você consegue
   pousar com apenas um ferimento. Você checa no mapa e vê que a cidade está a
   200 quilômetros. Sem outro meio para chegar até lá você terá que caminhar.
   Você pega seus kits médicos e sua arma e começa a caminhar.

\tSistema Estelar: Vanini
\t\tMundo: Aurora
\t\t\tAtmosfera: Respirável
\t\t\tTipos de Biomas: Aridos
"

read -p "Pressione enter para continuar..."

tela_da_mecanica
}

function tela_da_mecanica() {

  clear

  echo "
    Como você está a 200 quilômetros de distância do seu objetivo a cada
    quilômetro um dado será jogado trazendo para ti um evento aleatório.

    Eventos:
      - Nada: você teve sorte e só seguirá para o próximo quilômetro.
      - Batalha: você vai enfrentar um alien.
      - Locais: você encontra um local que pode ser explorado.
  "

  read -p "Pressione enter para continuar..."

  tela_do_jogador

}

function tela_do_jogador () {
  echo
}

tela_inicial
