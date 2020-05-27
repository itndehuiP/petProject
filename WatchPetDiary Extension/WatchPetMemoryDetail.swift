//
//  WatchPetMemoryDetail.swift
//  WatchPetDiary Extension
//
//  Created by Ines Pacheco on 26/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct WatchPetMemoryDetail: View {
    @EnvironmentObject var petData: PetData
    var petMemory: PetMemory
    var memoryIndex: Int {
        petData.petMemories.firstIndex(where: {$0.id == petMemory.id})!
    }
    
    var body: some View {
        ScrollView {
         VStack{
             PetProfileImage()
                 .scaledToFill()
             Text(petMemory.title)
             Divider()
           Toggle(isOn: $petData.petMemories[self.memoryIndex].isPet){
                         Text("Is pet")
                     }
         }
        }
    }
}

struct WatchPetMemoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        WatchPetMemoryDetail(petMemory: PetData().petMemories[0]).environmentObject(PetData())
    }
}
