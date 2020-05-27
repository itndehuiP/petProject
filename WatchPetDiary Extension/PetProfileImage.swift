//
//  PetProfileImage.swift
//  WatchPetDiary Extension
//
//  Created by Ines Pacheco on 27/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct PetProfileImage: View {
        
    var body: some View {
        HStack {

                Image("occiProfile").resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(ColorPalette.secondaryLightColor), lineWidth: 5))
                    .scaledToFit()
                    .padding()
                .shadow(radius: 10)
        }
    }
}

struct PetProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        PetProfileImage()
    }
}
