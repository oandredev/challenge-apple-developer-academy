### Challenge - Apple Developer Academy

Esse repositório consiste em um desafio desenvolvido durante o Workshop da Apple Developer Academy com objetivo de demonstrar o aprendizado em Swift.

<hr>

### RESUMO GERAL

- Jogo baseado em Turnos
- Para dois jogadores (PvP)
- Baseado em escolhas através do console
- Desenvolvido em Swift

<hr>

### Arena do Fluxo Celestial

Arena do Fluxo Celestial é um jogo de batalha em turnos, inspirado em RPG e card games, desenvolvido em Swift. Dois jogadores duelam utilizando cartas mágicas, que podem causar dano, curar, ou aplicar efeitos especiais ao longo dos turnos com objetivo de eliminar o seu adversário.

### Tutorial

#### Codinome
Cada jogador deve escolher um codinome para representa-lo

#### Essência
A essência é usada como pontos pra conseguir usar as cartas.
A essência aumenta a cada turno.
O quantidade de essência recebida a cada turno aumenta conforme as rodadas passam, tornando o jogo mais rápido.

#### Turnos
Cada rodada possui um turno de cada jogador, onde cada jogador recebe:
- Efeitos (Positivos e Negativos)
- Essência proporcional a rodada. OBS: Näo recebe se estiver atordoado e passa a jogada automaticamente.

#### Escolhas
As escolhas são dinâmicas e são exibidas conforme disponibilidade e tem relação com a Essência disponivel.
A opção escolhida deve ser informada através dos números informados.
O turno só muda se o jogador fizer uma escolha válida
Caso fique sem essência para jogar alguma carta, a única escolha possivel é: Pular a jogada.

#### Cartas
Existem diversas cartas, cada uma pode afetar em:
- Dano
- Cura
- Efeitos -> A cada turno o jogador recebe os efeitos que podem afetar a VIDA (DANO e/ou CURA), além do ATORDOAMENTO que pode inibir a jogada naquele turno.

No começo da partida 5 cartas são disponibilizas para cada jogador de forma aleatória, onde cada uma delas pode aplicar DANO, CURA, ou Efeitos (nem todas possuem).

##### Cartas - Detalhes

Cada carta possui seus atributos, veja abaixo:

<img width="2090" height="638" alt="image" src="https://github.com/user-attachments/assets/44fc0161-5a7a-4b85-9c5b-ec4cd1e72fa2" />


