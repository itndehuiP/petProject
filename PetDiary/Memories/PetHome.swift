//
//  PetHome.swift
//  PetDiary
//
//  Created by Ines Pacheco on 23/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct PetHome: View {
    
    @State var showingProfile = false
    @EnvironmentObject var petData: PetData
    
    let data = PetData()
    var categories: [String: [PetMemory]] {
        Dictionary(grouping: data.petMemories, by: { $0.category.rawValue } )
    }
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
        
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key] ?? [])
                }
            .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: MemoriesList{ MemoryDetail(petMemory: $0)}) {
                    Text("See all")
                }
            }
            .navigationBarTitle("Featured")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileView()
                    .environmentObject(self.petData)
            }
        }
    }
    

}

struct PetHome_Previews: PreviewProvider {
    static var previews: some View {
        PetHome()
        .environmentObject(PetData())
    }
}
