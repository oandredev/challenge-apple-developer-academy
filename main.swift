 /*
    Challenge - Apple Developer Academy
 
    Consiste em um desafio desenvolvido durante o Workshop da Apple Developer Academy com objetivo de demonstrar o aprendizado em Swift.

    RESUMO GERAL
    - Jogo baseado em Turnos
    - Para dois jogadores (PvP)
    - Baseado em escolhas através do console
    - Desenvolvido em Swift
  
    Desenvolvido por: André Rodrigues Farias da Silva
    E-mail: andre.rfsilva2@senacsp@edu.br
 */

import Foundation

// Codinomes disponíveis
let codinomes:  Set<String> = [
    "Cavaleiro Sombrio",
    "Mago das Trevas",
    "Arqueiro Fantasma",
    "Guerreiro Abissal",
    "Guardião da Névoa"
]

/* Structs */
struct Carta: Hashable {
    let nome: String
    let dano: Double
    let cura: Double
    let custo: Double
    let efeito: String
    let duracao: Int
    let valorEfeito: Double
    let alvoEfeito: Int // 0 Aplica em si própio | 1 Aplica no oponente
}

struct EfeitoAtivo: Hashable {
    let nome: String
    let duracao: Int
    let valor: Double
}

struct Jogador {
    var nome: String
    var vida: Double
    var essencia: Double
    var cartas: [Carta]
    var efeitosAtivos: Set<EfeitoAtivo>
    var estaAtordoado: Bool
}

let todasAsCartas: Set<Carta> = [
    Carta(nome: "Golpe Arcano", dano: 8, cura: 0, custo: 2, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Chama Sombria", dano: 15, cura: 0, custo: 4,
          efeito: "Queima o inimigo durante 2 turnos aplicando 8 de dano",
          duracao: 2, valorEfeito: 8, alvoEfeito:1),
    Carta(nome: "Corte Veloz", dano: 10, cura: 0, custo: 1, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Impacto Brutal", dano: 14, cura: 0, custo: 3,
          efeito: "Atordoa o inimigo (obriga a pular a vez)",
          duracao: 1, valorEfeito: 0, alvoEfeito:1),
    Carta(nome: "Golpe Dracônico", dano: 18, cura: 0, custo: 5,
          efeito: "Oponente recebe 3 de dano durante dois turnos",
          duracao: 2, valorEfeito: 3, alvoEfeito:1),
    Carta(nome: "Bênção da Vida", dano: 4, cura: 11, custo: 2, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Mantra de Cura", dano: 2, cura: 10, custo: 1, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Essência Restauradora", dano: 0, cura: 15, custo: 3, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Aura de Proteção", dano: 4, cura: 15, custo: 4,
          efeito: "Aura de Proteção: Aumenta a vida em 15% de vida na próxima rodada",
          duracao: 1, valorEfeito: 0.15, alvoEfeito:0),
    Carta(nome: "Lâmina da Aurora", dano: 8, cura: 4, custo: 2, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Explosão Vital", dano: 9, cura: 6, custo: 2, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
    Carta(nome: "Ciclo da Alma", dano: 6, cura: 5, custo: 4,
          efeito: "Regenera 10 de vida durante dois turnos",
          duracao: 2, valorEfeito: 10, alvoEfeito:0),
    Carta(nome: "Cura Sanguínea", dano: 4, cura: 8, custo: 1, efeito: "Nenhum", duracao: 0, valorEfeito: 0, alvoEfeito:-1),
]

// Jogadores
var jogadores: [Jogador] = [
    Jogador(nome: "", vida: 75, essencia: 4, cartas: [], efeitosAtivos: Set([]), estaAtordoado: false),
    Jogador(nome: "", vida: 75, essencia: 4, cartas: [], efeitosAtivos: Set([]), estaAtordoado: false)
]

// Fluxo do jogo
print("A Arena do Fluxo Celestial está aberta, hoje teremos uma batalha lendária!")

var acao = 1 // 1 -> Nova Partida | 2 -> Fechar jogo

main()

func main() {
    repeat {
        inicializarJogadores()
        escolherCodinomes()
        entregarCartas()
        partida()
        acao = iniciarNovaPartida()
    } while acao == 1
    
    print("\n------------------------------------------------------------------------------------------------------------------------------------------------------------")
    print ("\n[ANFITRIÃO] Obrigado por jogar, a Arena do Fluxo Celestial agradece.\n")
}

func iniciarNovaPartida() -> Int
{
    print("\n------------------------------------------------------------------------------------------------------------------------------------------------------------")
    
    var escolha: Int? = nil
    repeat {
        print("\n[ANFITRIÃO] Deseja iniciar uma nova partida?\n")
        print("1 -> Sim")
        print("2 -> Não")
        
        if let ent = readLine(), let n = Int(ent), n >= 1, n <= 2 {
            escolha = n
        } else {
            print("Opção inválida.")
        }
    } while escolha == nil
    
    return escolha!
}

func inicializarJogadores()
{
    jogadores = [
        Jogador(nome: "", vida: 75, essencia: 4, cartas: [], efeitosAtivos: Set([]), estaAtordoado: false),
        Jogador(nome: "", vida: 75, essencia: 4, cartas: [], efeitosAtivos: Set([]), estaAtordoado: false)
    ]
}

func escolherCodinomes() {

    var codinomesDisponiveis = Array(codinomes)
    
    for i in 0..<jogadores.count {
        print("\n------------------------------------------------------------------------------------------------------------------------------------------------------------")
        print("\n[ANFITRIÃO] Escolha seu codinome jogador \(i+1):")

        for (index, nome) in codinomesDisponiveis.enumerated() {
            print("-> \(index + 1). \(nome)")
        }

        var escolhaValida: Int? = nil

        repeat {
            print("Digite o número:")
            if let entrada = readLine(), let numero = Int(entrada),
                numero >= 1, numero <= codinomesDisponiveis.count {
                escolhaValida = numero
            } else {
                print("[ANFITRIÃO] Opção inválida.")
            }
        } while escolhaValida == nil

        let escolhido = codinomesDisponiveis[escolhaValida! - 1]
        jogadores[i].nome = escolhido
        codinomesDisponiveis.remove(at: escolhaValida! - 1)

        print("Jogador \(i+1): \(escolhido)")
    }
}

func entregarCartas() {
    var baralho = Array(todasAsCartas).shuffled()

    for i in 0...1 {
        jogadores[i].cartas = Array(baralho.prefix(5))
        baralho.removeFirst(5)
    }
    print("\n------------------------------------------------------------------------------------------------------------------------------------------------------------")
    print("\n[ANFITRIÃO] Cartas entregues. A batalha vai começar!")
}

func partida() {

    var rodada = 0

    while true {
        rodada += 1
        print("\n------------------------------------------------------------------------- Rodada \(rodada) -------------------------------------------------------------------------")

        for i in 0...1 {

            print("\n- - - Turno de \(jogadores[i].nome) - - -\n")
 
            aplicarEfeitos(i)
            verificaDuracaoEfeitos(i)
            
            if alguemMorreu() {
                print(quemVenceu())
                return
            }
            
            if jogadores[i].estaAtordoado {
                print("\n\(jogadores[i].nome) está atordoado e perdeu a vez!")
                jogadores[i].estaAtordoado = false
                continue
            }

            jogadores[i].essencia += adicionarEssencia(rodada)
           
            print("\n[STATUS] Vida: \(jogadores[i].vida) | Essência: \(jogadores[i].essencia)")

            let opcoes = mostrarOpcoes(jogador: jogadores[i])
            print(opcoes.menu)

            var escolha: Int? = nil
            repeat {
                print("\nEscolha sua jogada:")
                if let ent = readLine(), let n = Int(ent),
                   n >= 1, n <= opcoes.cartasDisponiveis.count + 1 {
                    escolha = n
                } else {
                    print("Opção inválida.")
                }
            } while escolha == nil

            if escolha! != opcoes.cartasDisponiveis.count + 1 {
                let alvo = (i == 0 ? 1 : 0)
                print("\n")
                fazerJogada(i, alvo, opcoes.cartasDisponiveis[escolha! - 1])
            } else {
                print("Pulou a jogada")
            }
            print("\n------------------------------------------------------------------------------------------------------------------------------------------------------------")
            if alguemMorreu() {
                print(quemVenceu())
                return
            }
        }
    }
}

func adicionarEssencia(_ rodada: Int) -> Double {
    return 1.0 + Double(rodada) * 0.05
}

func mostrarOpcoes(jogador: Jogador) -> (menu: String, cartasDisponiveis: [Carta]) {

    let cartas = jogador.cartas.filter { $0.custo <= jogador.essencia }
    var menu = "\n[CARTAS]"

    for (index, carta) in cartas.enumerated() {
        menu += "\n -> \(index + 1). \(carta.nome) (Custo: \(carta.custo) | Dano: \(carta.dano) | Cura: \(carta.cura) | Efeitos: \(carta.efeito))"
    }

    menu += "\n -> \(cartas.count + 1). Pular turno"

    return (menu, cartas)
}

func fazerJogada(_ jogador: Int, _ alvo: Int, _ carta: Carta) {
    jogadores[jogador].essencia -= carta.custo
    

    if carta.dano > 0 {
        jogadores[alvo].vida -= carta.dano
        print("\(jogadores[alvo].nome) recebeu \(carta.dano) de dano")
    }
    
    if carta.cura > 0 {
        jogadores[jogador].vida = min(100, jogadores[jogador].vida + carta.cura)
        print("\(jogadores[jogador].nome) recebeu \(carta.cura) de cura")
    }
    
    adicionarEfeitos(jogador, alvo, carta)
}

func adicionarEfeitos(_ jogador: Int, _ alvo: Int, _ carta: Carta)
{
    let efeitoBase = EfeitoAtivo( nome: carta.nome, duracao: carta.duracao, valor: carta.valorEfeito)

        switch carta.alvoEfeito {

            case 1: // inimigo
                if jogadores[alvo].efeitosAtivos.contains(where: { $0.nome == efeitoBase.nome }) {
                    print("Efeito anulado: inimigo já possui esse efeito.")
                } else {
                    jogadores[alvo].efeitosAtivos.insert(efeitoBase)
                    
                    print ("\(jogadores[alvo].nome) recebeu o efeito do ataque | +\(efeitoBase.duracao) rodada(s)")
                }
            case 0:
            
                var efeitos = jogadores[jogador].efeitosAtivos

                if let existente = efeitos.first(where: { $0.nome == efeitoBase.nome })
                {
                    efeitos.remove(existente)
                }
                
                efeitos.insert(efeitoBase)
                jogadores[jogador].efeitosAtivos = efeitos
            default:
                break
        }
    
}

func alguemMorreu() -> Bool {
    return jogadores.contains(where: { $0.vida <= 0 })
}

func quemVenceu() -> String {
    if jogadores[0].vida <= 0 && jogadores[1].vida <= 0 {
        return "\nRESULTADO DA BATALHA: EMPATE!\n\n[ANFITRIÃO] Olha que curioso, tivemos um empate, parece que teremos que ter uma nova batalha"
    }
    if jogadores[0].vida <= 0
    { 
        return "RESULTADO DA BATALHA: \(jogadores[1].nome) venceu!\n\n[ANFITRIÃO] Parabéns \(jogadores[1].nome), o \(jogadores[0].nome) foi ELIMINADO!"
    }
    else
    {
        return "RESULTADO DA BATALHA: \(jogadores[0].nome) venceu!\n\n[ANFITRIÃO] Parabéns \(jogadores[0].nome), o \(jogadores[1].nome) foi ELIMINADO!"
    }
}

// Efeitos

func verificaDuracaoEfeitos(_ jogador: Int) {
    var novoSet = Set<EfeitoAtivo>()

    for efeito in jogadores[jogador].efeitosAtivos {
        if efeito.duracao > 1 {
            novoSet.insert(EfeitoAtivo(nome: efeito.nome, duracao: efeito.duracao - 1, valor: efeito.valor))
        }
    }
    // Nâo precisa remover porque já desconsidera se a duração for 0
    jogadores[jogador].efeitosAtivos = novoSet
}

func aplicarEfeitos(_ jogador: Int) {

    var totalCura = 0.0
    var totalDano = 0.0
    var atordoado = false
    
    let efeitos = jogadores[jogador].efeitosAtivos

    if efeitos.isEmpty {
        print("[EFEITOS] Nenhum efeito neste turno.")
        return
    }

    for efeito in efeitos {
        switch efeito.nome {
        case "Chama Sombria":
            totalDano += efeito.valor
            print(" > Chama Sombria: Recebeu 8 de dano")
        case "Impacto Brutal":
            atordoado = true
        case "Golpe Dracônico":
            totalDano += efeito.valor
            print(" > Golpe Dracônico: Recebeu 3 de dano")
        case "Aura de Proteção":
            totalCura += jogadores[jogador].vida * efeito.valor
            print(" Aura de Proteção: Regenerou 15% de vida")
        case "Ciclo da Alma":
            totalCura += efeito.valor
            print(" > Ciclo da Alma: Regenerou \(efeito.valor) de vida")
        default:
            break
        }
    }

    jogadores[jogador].vida += totalCura
    jogadores[jogador].vida -= totalDano
    jogadores[jogador].estaAtordoado = atordoado
}
