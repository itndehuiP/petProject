//
//  PetMemory.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import Foundation

struct PetMemory: Codable, Identifiable {
    var id: Int
    let date: Date
    let title: String
    let imageData: String
    let description: String
    var isPet: Bool
    var category: Category
    
    func getDateDescription() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / MM / yyyy"
        return formatter.string(from: date)
    }
    
    enum Category: String, CaseIterable, Codable {
        case funny = "Funny"
        case lost = "Lost"
        case adoption = "Adoption"
    }
}
