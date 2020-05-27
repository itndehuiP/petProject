//
//  MemoryDetail.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct MemoryDetail: View {
    @EnvironmentObject var petData: PetData
    var petMemory: PetMemory
    
    var petMemoryIndex: Int {
        petData.petMemories.firstIndex(where: { $0.id == petMemory.id})!
    }
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    self.petData.petMemories[self.petMemoryIndex].isPet.toggle()
                }) {
                    if self.petData.petMemories[self.petMemoryIndex].isPet {
                        Image(systemName: "heart.circle.fill")
                            .foregroundColor(Color(ColorPalette.secondaryDarkColor))
                    } else {
                        Image(systemName: "heart.circle.fill")
                            .foregroundColor(Color(ColorPalette.primaryDarkColor))
                    }
                }
                Spacer()
                Text(petMemory.title)
                .font(.title)
                .fontWeight(.bold)
                Spacer()
            }
            

            PetMemoryImage(imageName: petMemory.imageData)
            HStack {
                Text(Date().description)
                .offset(x: 20, y: -20)          .font(.caption)
                    
                Spacer()
            }
            Text(petMemory.description)
                .multilineTextAlignment(.center)
                
            Spacer()
        }
    .padding()
    }
}

struct MemoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        MemoryDetail(petMemory: PetMemory(id: 0, date: Date(), title: "Lola la", imageData: "occiProfile", description: "dud", isPet: true, category: .funny))
    }
}
