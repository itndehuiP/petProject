//
//  CategoryRow.swift
//  PetDiary
//
//  Created by Ines Pacheco on 23/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [PetMemory]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { memory in
                        CategoryItem(memory: memory)
                    }
                }
            }
        .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    
    var memory: PetMemory
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(memory.imageData).resizable()
            .scaledToFill()
            .frame(width: 155, height: 155)
            .cornerRadius(10)
            
            Text(memory.title)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: PetData().petMemories[1].category.rawValue, items: PetData().petMemories)
    }
}
