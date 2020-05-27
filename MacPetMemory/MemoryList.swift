//
//  MemoryList.swift
//  MacPetMemory
//
//  Created by Ines Pacheco on 26/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct MemoryList: View {
    @EnvironmentObject var petData: PetData
    
    var body: some View {
        List {
            ForEach(petData.petMemories) { memory in
                MacPetMemoryRow(petMemory: memory)
            }
        }
    }
}

struct MemoryList_Previews: PreviewProvider {
    static var previews: some View {
        MemoryList()
        .environmentObject(PetData())
    }
}
