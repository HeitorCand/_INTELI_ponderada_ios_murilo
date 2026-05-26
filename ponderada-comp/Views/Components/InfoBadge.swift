//
//  InfoBadge.swift
//  ponderada-comp
//
//  Created by Heitor Candido on 25/05/26.
//

import SwiftUI

enum BadgeType {
    case episodio
    case temporada
    case concluido
}

struct InfoBadge: View {
    let programa: Programa
    let type: BadgeType

    private var valueText: String {
        switch type {
        case .episodio:
            return "\(programa.episodios)"
        case .temporada:
            return "\(programa.temporadas)"
        case .concluido:
            return programa.status
        }
    }

    private var labelText: String {
        switch type {
        case .episodio:
            return "Episódios"
        case .temporada:
            return "Temporadas"
        case .concluido:
            return "Status"
        }
    }
    
    private var iconText: String {
        switch type {
        case .episodio:
            return "📼"
        case .temporada:
            return "🎬"
        case .concluido:
            return "✅"
        }
    }


    private var accentColor: Color {
        switch type {
        case .episodio:
            return .blue
        case .temporada:
            return .green
        case .concluido:
            return programa.status.lowercased() == "concluido" ? .green : .orange
        }
    }
 
    var body: some View {
        VStack(spacing: 8) {
            Text(iconText)
            Text(valueText)
                .font(.title2.bold())
                .foregroundStyle(accentColor)
            Text(labelText)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(12)
            .background(accentColor.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(accentColor, lineWidth: 1)
            )
    }
}

#Preview {
    InfoBadge(programa: naruto, type: .temporada)
}

#Preview {
    InfoBadge(programa: strangerThings, type: .episodio)
}

#Preview {
    InfoBadge(programa: avatar, type: .concluido)
}
