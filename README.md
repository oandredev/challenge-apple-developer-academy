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

<br>

#### Essência
A essência é usada como pontos pra conseguir usar as cartas.
A essência aumenta a cada turno.
O quantidade de essência recebida a cada turno aumenta conforme as rodadas passam, tornando o jogo mais rápido.

<br>

#### Turnos
Cada rodada possui um turno de cada jogador, onde cada jogador recebe:
- Efeitos (Positivos e Negativos)
- Essência proporcional a rodada. OBS: Näo recebe se estiver atordoado e passa a jogada automaticamente.

<br>

#### Escolhas
As escolhas são dinâmicas e são exibidas conforme disponibilidade e tem relação com a Essência disponivel.
A opção escolhida deve ser informada através dos números informados.
O turno só muda se o jogador fizer uma escolha válida
Caso fique sem essência para jogar alguma carta, a única escolha possivel é: Pular a jogada.

<br>

#### Cartas
Existem diversas cartas, cada uma pode afetar em:
- Dano
- Cura
- Efeitos -> A cada turno o jogador recebe os efeitos que podem afetar a VIDA (DANO e/ou CURA), além do ATORDOAMENTO que pode inibir a jogada naquele turno.

No começo da partida 5 cartas são disponibilizas para cada jogador de forma aleatória, onde cada uma delas pode aplicar DANO, CURA, ou Efeitos (nem todas possuem).

##### Cartas - Detalhes

Cada carta possui seus atributos, veja abaixo:

<img width="2090" height="638" alt="image" src="https://github.com/user-attachments/assets/44fc0161-5a7a-4b85-9c5b-ec4cd1e72fa2" />

<hr>

### Como jogar?

1. No começo de cada partida você deverá informar o codinome escolhido.

2. A cada turno você deve escolher umas das cartas listadas, para isso deve digitar o número correspondente (Caso não possua essência suficiente deverá passar a vez)

3. As cartas só são listadas se você possuir a essência necessária para usa-lá, caso queira ver detalhes veja a tabela acima. 

4. Perde quem ficar sem vida primeiro, ou seja, vida == 0.

5. IMPORTANTE: No inicio do turno se existirem efeitos ativos eles serão executados (exemplo: recebeu 5 de dano), ao fim do turno a jogada é realizada e processada, se o ataque possuir efeitos, o mesmo será processado no inicio do próximo turno.
