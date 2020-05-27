//
//  ProfileSummary.swift
//  PetDiary
//
//  Created by Ines Pacheco on 23/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    var petProfile: PetProfile
    
    var body: some View {
    
        VStack(alignment: .leading) {
            Text("Breed")
                .font(.headline)
            Divider()
            Text(petProfile.breed.rawValue)
            Divider()
            Text("Description")
                .font(.headline)
            Divider()
            Text(petProfile.description)
        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(petProfile: PetProfile.default)
    }
}
