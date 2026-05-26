//
//  ShowCard.swift
//  ponderada-comp
//
//  Created by Heitor Candido on 25/05/26.
//

import SwiftUI

enum TipoPrograma: String {
    case anime = "Anime"
    case desenho = "Desenho"
    case serie = "Serie"
    
    var color: Color {
        switch self {
        case .anime:
            return .orange
        case .desenho:
            return .blue
        case .serie:
            return .purple
        }
    }
    
    // Cor de fundo suave para o thumbnail
    var softBackground: Color {
        color.opacity(0.15)
    }
}

struct ShowCard: View {
    let programa: Programa
    
    private var tipo: TipoPrograma? {
        TipoPrograma(rawValue: programa.tipo)
    }
 
    var body: some View {
        NavigationLink {
            ProgramaDetalheView(programa: programa)
        } label: {
            HStack(spacing: 12) {
                // Barra lateral colorida por tipo
                RoundedRectangle(cornerRadius: 10)
                    .fill(tipo?.color ?? .gray)
                    .frame(width: 6)
                
                // Thumbnail com emoji
                RoundedRectangle(cornerRadius: 18)
                    .fill((tipo?.softBackground ?? Color.gray.opacity(0.15)))
                    .frame(width: 90, height: 110)
                    .overlay(
                        Text(programa.emoji)
                            .font(.system(size: 40))
                    )
                
                // Conteúdo
                VStack(alignment: .leading, spacing: 6) {
                    // Badge de tipo
                    Text(programa.tipo.capitalized)
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(tipo?.color ?? .gray)
                        .clipShape(Capsule())

                    // Nome
                    Text(programa.nome)
                        .font(.headline.bold())

                    // Gênero
                    Text(programa.genero)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    // Avaliação: 5 estrelas + nota numérica
                    HStack(spacing: 4) {
                        let estrelas = Int(programa.avaliacao.rounded())
                        ForEach(0..<estrelas, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        
                        Text(String(format: "%.1f", programa.avaliacao))
                            .foregroundStyle(.secondary)
                    }
                    .font(.subheadline)
                }
                
                Spacer()
                
                // Chevron à direita
                Image(systemName: "chevron.right")
                    .foregroundStyle(.tertiary)
            }
            .padding(12)
            .background(Color(.gray).opacity(0.05))
            .cornerRadius(16)
            .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        ShowCard(programa: naruto)
    }
}

#Preview {
    NavigationStack {
        ShowCard(programa: strangerThings)
    }
}

#Preview {
    NavigationStack {
        ShowCard(programa: avatar)
    }
}
