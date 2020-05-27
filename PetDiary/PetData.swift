//
//  PetData.swift
//  PetDiary
//
//  Created by Ines Pacheco on 19/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI
import Combine

final class PetData: ObservableObject {
    @Published var profile = PetProfile.default
    @Published var showPetOnly = false
    @Published var petMemories = [
        PetMemory(id: 0, date: Date(), title: "Occi A", imageData: "occiProfile", description: "A", isPet: true, category: .adoption),
        PetMemory(id: 1, date: Date(), title: "Occi B", imageData: "occiProfile", description: "B", isPet: false, category: .funny),
        PetMemory(id: 2, date: Date(), title: "Occi C", imageData: "occiProfile", description: "C", isPet: true, category: .lost)]
}
