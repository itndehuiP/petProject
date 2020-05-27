//
//  FutureCard.swift
//  PetDiary
//
//  Created by Ines Pacheco on 25/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct FeatureCard: View {
    var petMemory: PetMemory

    var body: some View {
        ZStack(){
            Image(petMemory.imageData).resizable()
            .overlay(TextOverlay(petMemory: petMemory))

        }
    }
}

struct TextOverlay: View {
    var petMemory: PetMemory
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(petMemory.title)
                    .font(.title)
                    .bold()
                
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(petMemory: PetData().petMemories[0])
    }
}
