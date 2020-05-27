//
//  MacPetMemoryRow.swift
//  MacPetMemory
//
//  Created by Ines Pacheco on 26/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct MacPetMemoryRow: View {
    var petMemory: PetMemory
    
    var body: some View {
        VStack {
            HStack {
                  Image("occiProfile").resizable()
                .frame(width: 50, height: 50)
                      .scaledToFit()
                      .padding()
                  .shadow(radius: 10)
                  VStack {
                      Text(petMemory.title)
                          .font(.title)
                      Text(petMemory.getDateDescription())
                          .font(.subheadline)
                  }
              }
            Text(petMemory.description)
        }
    .padding()
  
    }
}

struct MacPetMemoryRow_Previews: PreviewProvider {
    static var previews: some View {
        MacPetMemoryRow(petMemory: PetData().petMemories[0])
    }
}
