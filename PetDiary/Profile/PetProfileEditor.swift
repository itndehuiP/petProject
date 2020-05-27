//
//  PetProfileEditor.swift
//  PetDiary
//
//  Created by Ines Pacheco on 24/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct PetProfileEditor: View {
    @Binding var petProfile: PetProfile
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -20, to: Date())!
        let max = Date()
        return min...max
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
              Picker("Breed", selection: $petProfile.breed){
                ForEach(Breed.allCases, id: \.self) { breed in
                    Text(breed.rawValue)
                }
            }
        
            Divider()
            Text("Description")
                .font(.headline)
            TextField("Tell us how \(petProfile.name) is", text: $petProfile.description)
            Divider()
            DatePicker("Birthday", selection: $petProfile.birthday, in: dateRange, displayedComponents: .date)
        }
    .padding(10)
    }
}

struct PetProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        PetProfileEditor(petProfile: .constant(PetProfile.default))
    }
}
