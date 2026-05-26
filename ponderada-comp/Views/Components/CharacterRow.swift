//
//  CharacterRow.swift
//  ponderada-comp
//
//  Created by Heitor Candido on 25/05/26.
//

import SwiftUI


struct CharacterRow: View {
    let nome: String
    let emoji: String
    let descricao: String
    
 
    var body: some View {
        
        HStack(spacing: 6){
            
            Text(emoji)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(nome)
                    .font(.headline.bold())
                
                Text(descricao)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
            }
        }
        .padding(12)
        .background(Color(.gray).opacity(0.05))
        .cornerRadius(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}

#Preview {
    CharacterRow(nome: "Heitor", emoji: "\u{1F526}", descricao: "ooioioi oioi ")
}
