//
//  ContentView.swift
//  WatchPetDiary Extension
//
//  Created by Ines Pacheco on 26/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MemoriesList { WatchPetMemoryDetail(petMemory: $0)}
        .environmentObject(PetData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesList { WatchPetMemoryDetail(petMemory: $0)}
        .environmentObject(PetData())
    }
}
