#!/usr/bin/env bash
# v0.0.1
# Este é um jogo de RPG em texto.

source classes-personagens.lib
source monstros.lib

NOME_DO_PERSONAGEM=""     # Guarda o nome do personagem no nivel Global
CLASSE_DO_PERSONAGEM=""   # Guarda a classe do personagem em nivel global.
NUMERO_TOTAL_DE_XP=""     # Guarda o total de experiencia do personagem.
SOMA_DE_QUILOMETROS="0"   # Guarda os quilômetros percorridos.
NUMERO_DO_EVENTO=""       # Guarda o número do evento.
OPCAO_BATALHA=""
VIDA_NA_BATALHA=""
CHAVE_MOSTRO="0"
CHAVE_PERSONAGEM="0"
NOME_PERSONAGEM=""        # Guarda a nome do personagem.
VIDA_PERSONAGEM=""        # Guarda a vida do personagem.
ATAQUE_PERSONAGEM=""      # Guarda o ataque do personagem.
DEFESA_PERSONAGEM=""      # Guarda a defesa do personagem.
VELOCIDADE_PERSONAGEM=""  # Guarda a velocidade do personagem.
NOME_MONSTRO=""           # Guarda a nome do monstro.
VIDA_MONSTRO=""           # Guarda a vida do monstro.
ATAQUE_MONSTRO=""         # Guarda o ataque do monstro.
DEFESA_MONSTRO=""         # Guarda a defesa do monstro.
VELOCIDADE_MONSTRO=""     # Guarda a velocidade do monstro.

function opcao_invalida() { # Frase de opção invalida.
  clear
  echo "Opção invalida."
  sleep 3
}

function tela_inicial() { # Função da tela inicial.
  OPCAO_TELA_INICIAL="" # Variável para tela inicial.

  clear

  echo -e "SPACE RPG\n       TEXT"
  echo -e "1 - Iniciar\n2 - Sair"
  echo -n ">>> " ; read OPCAO_TELA_INICIAL

  OPCAO_TELA_INICIAL="${OPCAO_TELA_INICIAL^^}" # Troca letras minusculas por
                                               # letras maiúsculas.

  case $OPCAO_TELA_INICIAL in # Case que verifica a opção escolhida.
    1 | "I" | "INICIAR" )
    tela_personagens
      ;;
    2 | "S" | "SAIR" )
    exit 0
      ;;
    * )
    opcao_invalida
    tela_inicial
      ;;
  esac
}

function habilidade_do_personagem() {
  case $CLASSE_DO_PERSONAGEM in
  1 )
  engeiero
  ;;
  2 )
  fuzileiro
  ;;
  3 )
  cientista
  ;;
  esac
}


function tela_personagens() { # Tela do personagem, o personagem é armazenado
                              # em uma variável.
  clear

  echo "| ID: 1            | ID: 2             | ID: 3             |"
  echo "| Classe: Engeiero | Classe: Fuzileiro | Classe: Cientista |"
  echo "| Vida: 40         | Vida: 45          | Vida: 50          |"
  echo "| Ataque: 8        | Ataque: 10        | Ataque: 6         |"
  echo "| Defesa: 10       | Defesa: 6         | Defesa: 8         |"
  echo "| Velocidade: 6    | Velocidade: 8     | Velocidade: 10    |"
  echo "Digite o ID do personagens ou (S)air para voltar a tela inicail."
  echo -n ">>> " ; read PERSONAGEM_ESCOLHIDO

  PERSONAGEM_ESCOLHIDO="${PERSONAGEM_ESCOLHIDO^^}" # Troca letras minusculas por
                                                   # letras maiúsculas.

  case $PERSONAGEM_ESCOLHIDO in # Case que verifica a opção escolhida.
    1 | 2 | 3)
    CLASSE_DO_PERSONAGEM=$PERSONAGEM_ESCOLHIDO
    habilidade_do_personagem
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


function tela_nome() { # Tela nomearmazena o nome escolhido em uma variável.
  NOME_ESCOLHIDO="" # Variável local que guarda o nome escolhido.

  clear

  read -p "Digite o nome do seu personagem: " NOME_ESCOLHIDO

  if [ -z $NOME_ESCOLHIDO ]; then # If para verificar se a variável do
    NOME_ESCOLHIDO="Jogador"            # nome esta vazia. Caso esteja vazia
                                        # é dado o nome padrão de Jogador.
  fi

  NOME_DO_PERSONAGEM=$NOME_ESCOLHIDO # Colocando o nome na variável global.

  clear

  echo "O nome escolhido foi: $NOME_ESCOLHIDO"

  sleep 5

  tela_da_sinopse
}


function tela_da_sinopse() { # Tela da sinopse

  clear

  echo -e "
   Você entrou na atmosfera de Aurora no sistema estelar de Vanini. Em alguns
   segundos a sua nave começa a dar vários alarmes de panes em alguns sistemas
   críticos, o  pouso controlado da nave se torna impossível, mas você consegue
   pousar com apenas um ferimento. Você checa no mapa e vê que a cidade está a
   200 quilômetros. Sem outro meio para chegar até lá você terá que caminhar.
   Você pega seus kits médicos e sua arma e começa a caminhar.

\tSistema Estelar: Vanini
\t\tPlaneta: Aurora
\t\t\tAtmosfera: Respirável
\t\t\tTipos de Biomas: Aridos
"

read -p "Pressione enter para continuar..."

tela_da_mecanica
}

function tela_da_mecanica() { # Tela que explica como o jogo funciona.

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

function tela_do_jogador () { # Tela onde o jogo se desenrola até o fim.

  ESCOLHA_JOGADOR=""

  clear

  echo -e "1 - Andar mais um quilômetro   2 - Entrar no menu   3 - Sair\n\n"
  echo -e "Quilômetros percoridos: $SOMA_DE_QUILOMETROS"

  read -p "Escolha a opção: " ESCOLHA_JOGADOR

  case $ESCOLHA_JOGADOR in # Case para verificar a opção escolhida.
    1 )
    progresso_no_jogo
      ;;
    2 )
    menu
      ;;
    3 )
    sair_tela_jogador
      ;;
    * )
    opcao_invalida
    tela_do_jogador
      ;;
  esac
}


function sair_tela_jogador() { # Tela para sair do jogo, depois do jogo
  OPCAO_JOGADOR=""             # iniciado.

  clear

  echo -e "Saindo do jogo todo o progresso será perdido\n1 - Sair | 2 - Voltar"

  read -p ">>> " OPCAO_JOGADOR

  case $OPCAO_JOGADOR in # Case para verificar a opção escolhida.
    1 )
    exit 0
      ;;
    2 )
    tela_do_jogador
      ;;
    * )
    opcao_invalida
    sair_tela_jogador
      ;;
  esac
}

function progresso_no_jogo() { # Esta função faz o sorteio do que vai acontecer
                               # no evento do quilômetro.
  FRASE_NADA="Você andou mais um quilômetro sem problemas."
  NUMERO_PROGRESSO=$((RANDOM % 3 + 1))

  case $NUMERO_PROGRESSO in # Case para verificar a opção escolhida.
    1 )
    let SOMA_DE_QUILOMETROS=SOMA_DE_QUILOMETROS+1
    clear
    echo "$FRASE_NADA"
    sleep 3
    tela_do_jogador
      ;;
    2 )
    let SOMA_DE_QUILOMETROS=SOMA_DE_QUILOMETROS+1
    batalha
      ;;
    3 )
    let SOMA_DE_QUILOMETROS=SOMA_DE_QUILOMETROS+1
    clear
    echo "$NUMERO_PROGRESSO"
    sleep 3
      ;;
  esac
  tela_do_jogador
}


function sorteio_de_alien() {
  $(shuf -n 1 lista-monstros)
}

function opcao_batalha() {
  CHAVE_MOSTRO="0"
  CHAVE_PERSONAGEM="0"
  clear
  echo "Alien: $NOME_MONSTRO | Vida: $VIDA_MONSTRO"
  echo "Personagem: $NOME_DO_PERSONAGEM | Vida: $VIDA_NA_BATALHA"
  echo "1 - Atacar | 2 - Item | 3 - Fugir"
  read -p ">>> " OPCAO_BATALHA
  case $OPCAO_BATALHA in
    1 )
    dado_sleep
      ;;
    2 )
      ;;
    3 )
      ;;
    * )
    opcao_invalida
    opcao_batalha
      ;;
  esac
}

function dado_ataque() {
  DADO_ATAQUE=$((RANDOM % $ATAQUE_PERSONAGEM + 1))
  DADO_DEFESA=$((RANDOM % $DEFESA_MONSTRO + 1))
  DADO_MENOS=$(echo "$DADO_ATAQUE - $DADO_DEFESA" | bc)
  if [[ "$DADO_MENOS" -lt 0 ]]; then
    dado_ataque
  else
    VIDA_MONSTRO=$(echo "$VIDA_MONSTRO - $DADO_MENOS" | bc)
  fi
  clear
  echo " Você retirou $DADO_MENOS de dano do $NOME_MONSTRO."
  sleep 3
  if [[ "$VIDA_MONSTRO" -le 0 ]]; then
    clear
    echo "O $NOME_MONSTRO morreu!"
    sleep 3
    tela_do_jogador
  elif [[ "$CHAVE_MOSTRO" == 1 ]]; then
    dado_ataque_monstro
  else
    opcao_batalha
  fi
}

function dado_ataque_monstro() {
  DADO_ATAQUE=$((RANDOM % $ATAQUE_MONSTRO + 1))
  DADO_DEFESA=$((RANDOM % $DEFESA_PERSONAGEM + 1))
  DADO_MENOS=$(echo "$DADO_ATAQUE - $DADO_DEFESA" | bc)
  if [[ "$DADO_MENOS" -lt 0 ]]; then
    dado_ataque_monstro
  else
    VIDA_NA_BATALHA=$(echo "$VIDA_NA_BATALHA - $DADO_MENOS" | bc)
  fi
  clear
  echo " Você tou $DADO_MENOS de dano."
  sleep 3
  if [[ "$VIDA_NA_BATALHA" -le 0 ]]; then
    clear
    echo -e "O $NOME_DO_PERSONAGEM morreu!\nFim do jogo!"
    sleep 3
    NOME_DO_PERSONAGEM=""     # Guarda o nome do personagem no nivel Global
    CLASSE_DO_PERSONAGEM=""   # Guarda a classe do personagem em nivel global.
    NUMERO_TOTAL_DE_XP=""     # Guarda o total de experiencia do personagem.
    SOMA_DE_QUILOMETROS=""    # Guarda os quilômetros percorridos.
    NUMERO_DO_EVENTO=""       # Guarda o número do evento.
    OPCAO_BATALHA=""
    VIDA_NA_BATALHA=""
    CHAVE_MOSTRO="0"
    CHAVE_PERSONAGEM="0"
    NOME_PERSONAGEM=""        # Guarda a nome do personagem.
    VIDA_PERSONAGEM=""        # Guarda a vida do personagem.
    ATAQUE_PERSONAGEM=""      # Guarda o ataque do personagem.
    DEFESA_PERSONAGEM=""      # Guarda a defesa do personagem.
    VELOCIDADE_PERSONAGEM=""  # Guarda a velocidade do personagem.
    NOME_MONSTRO=""           # Guarda a nome do monstro.
    VIDA_MONSTRO=""           # Guarda a vida do monstro.
    ATAQUE_MONSTRO=""         # Guarda o ataque do monstro.
    DEFESA_MONSTRO=""         # Guarda a defesa do monstro.
    VELOCIDADE_MONSTRO=""     # Guarda a velocidade do monstro.
    tela_inicial
  elif [[ "$CHAVE_PERSONAGEM" == 1 ]]; then
    dado_ataque
  else
    opcao_batalha
  fi
}

function dado_sleep() {
  DADO_S_PERSONAGEM=$((RANDOM % $VELOCIDADE_PERSONAGEM + 1))
  DADO_S_MONSTER=$((RANDOM % $VELOCIDADE_MONSTRO + 1))

  if [[ "$DADO_S_PERSONAGEM" -gt "$DADO_S_MONSTER" ]]; then
    clear
    echo "meu dado de velocidade: $DADO_S_PERSONAGEM dado do monstro: $DADO_S_MONSTER"
    sleep 5
    CHAVE_MOSTRO=1
    CHAVE_PERSONAGEM=0
    dado_ataque
  elif [[ DADO_S_MONSTER -gt DADO_S_PERSONAGEM ]]; then
    clear
    echo "dado do monstro: $DADO_S_MONSTER meu dado de velocidade: $DADO_S_PERSONAGEM "
    sleep 5
    CHAVE_PERSONAGEM=1
    CHAVE_MOSTRO=0
    dado_ataque_monstro
  else
    dado_sleep
  fi
}

function batalha() {
  VIDA_NA_BATALHA=$VIDA_PERSONAGEM
  sorteio_de_alien
  opcao_batalha
}

tela_inicial
