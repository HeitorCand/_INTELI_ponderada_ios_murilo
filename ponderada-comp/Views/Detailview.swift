//
//  Detailview.swift
//  ponderada-comp
//
//  Created by Heitor Candido on 25/05/26.
//

import SwiftUI

struct ProgramaDetalheView: View {

    let programa: Programa

    var body: some View {

        ScrollView {

            VStack(spacing: 0) {

                // HERO / HEADER
                ZStack(alignment: .bottomLeading) {

                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.purple, .black],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: 320)

                    VStack(alignment: .leading, spacing: 12) {

                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white.opacity(0.15))
                            .frame(width: .infinity, height: 140)
                            .overlay(
                                Text(programa.emoji).font(.largeTitle)
                            )

                        Text(programa.tipo)
                            .font(.caption.bold())
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(.orange)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())

                        Text(programa.nome)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                    }
                    .padding(24)
                }

                // CONTEÚDO
                VStack(alignment: .leading, spacing: 24) {

                    // SINOPSE
                    VStack(alignment: .leading, spacing: 12) {

                        Text("Sinopse")
                            .font(.title2.bold())

                        Text(programa.sinopse)
                            .foregroundStyle(.secondary)
                    }

                    Divider()

                    // INFO BADGES
                    VStack(alignment: .leading, spacing: 16) {

                        Text("Informações")
                            .font(.title2.bold())

                        HStack(spacing: 12) {

                            InfoBadge(
                                programa: programa,
                                type: .episodio
                            )

                            InfoBadge(
                                programa: programa,
                                type: .temporada
                            )

                            InfoBadge(
                                programa: programa,
                                type: .concluido
                            )
                        }
                    }

                    Divider()

                    // PERSONAGENS
                    VStack(alignment: .leading, spacing: 16) {

                        Text("Personagens Principais")
                            .font(.title2.bold())

                        VStack(spacing: 12) {
                            // Opção 1: usar índices para garantir IDs únicos
                            ForEach(programa.personagens.indices, id: \.self) { index in
                                let personagem = programa.personagens[index]
                                CharacterRow(
                                    nome: personagem.nome,
                                    emoji: personagem.emoji,
                                    descricao: personagem.papel
                                )
                            }


                        }
                    }

                    // BOTÃO
                    Button {

                    } label: {

                        Text("Ver Todos os Episódios")
                            .font(.headline.bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.orange)
                            .clipShape(Capsule())
                    }
                    .padding(.top)
                }
                .padding(24)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ProgramaDetalheView(programa: naruto)
}
