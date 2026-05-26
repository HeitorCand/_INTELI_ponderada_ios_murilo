//
//  ListaView.swift
//  ponderada-comp
//
//  Created by Heitor Candido on 25/05/26.
//

import SwiftUI

let programas: [Programa] = [
   naruto,
   avatar,
   strangerThings
]
    
struct ListaView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(programas.indices, id: \.self) { index in
                        ShowCard(programa: programas[index])
                    }

                }
                .padding()
            }
            .navigationTitle("Programas")
        }
    }
}


#Preview {
    ListaView()
}
