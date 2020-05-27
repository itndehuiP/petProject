//
//  MemoryRow.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct MemoryRow: View {
    var memory: PetMemory

    
    var body: some View {
        HStack{
            Image(memory.imageData).resizable()
            .scaledToFit()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(memory.title)
                Text(memory.getDateDescription())
            }
            Spacer()
            if memory.isPet {
                Image(systemName: "heart.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(Color(ColorPalette.secondaryDarkColor))
                
            }
        }
    .padding()
    
    }
}

struct MemoryRow_Previews: PreviewProvider {
    static var previews: some View {
        MemoryRow(memory: PetMemory(id: 0, date: Date(), title: "Occi 1", imageData: "occiProfile", description: "Day in Oaxaca", isPet: true, category: .adoption))
    }
}
