//
//  PetProfile.swift
//  PetDiary
//
//  Created by Ines Pacheco on 23/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import Foundation

struct PetProfile {
    var name: String
    var birthday: Date
    var breed: Breed
    var description: String
    
    
    static let `default` = Self(name: "Occi", birthday: Date())
    
    init(name: String, birthday: Date, breed: Breed = .husky, description: String  = "Occi is a loyal companion. She loves so much to her family, she never miss any family time. She does not usually bark, but if she does is because there's real danger. She's very protective with the ones she loves.") {
        self.name = name
        self.birthday = birthday
        self.breed = breed
        self.description = description
    }
}

enum Breed: String, CaseIterable {
    case husky = "Siberian Husky"
    case goldenRetriever = "Golden Retriever"
    case pug = "Pug"
    case chihuahua = "Chihuahua"
    case other = "Other"
}
