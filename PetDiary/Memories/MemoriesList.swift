//
//  MemoriesList.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

 
struct MemoriesList<DetailView: View>: View {
    @EnvironmentObject var petData: PetData

    
    
    let detailViewProducer: (PetMemory) -> DetailView
    
    var body: some View {
            List {


                Toggle(isOn: $petData.showPetOnly) {
                    Text("Pet memories only")
                }


                
                ForEach(petData.petMemories) { memory in
                    if !self.petData.showPetOnly || memory.isPet {
                        NavigationLink(destination: self.detailViewProducer(memory).environmentObject(self.petData)){
                            MemoryRow(memory: memory)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Memories"))

    }

    
}


#if os(watchOS)
typealias PreviewDetailView = WatchPetMemoryDetail
#else
typealias PreviewDetailView = MemoryDetail
#endif

struct MemoriesList_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesList{ PreviewDetailView(petMemory: $0) }
        .environmentObject(PetData())
    }
}
