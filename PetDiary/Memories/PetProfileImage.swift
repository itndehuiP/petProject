//
//  PetProfileImage.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct PetProfileImage: View {
    
    @Binding var profileImg: Image?
    
    var body: some View {
        HStack {
            if profileImg != nil {
                profileImg?.resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(ColorPalette.secondaryLightColor), lineWidth: 5))
                    .scaledToFit()
                    .padding()
                .shadow(radius: 10)
            } else {
                Image("occiProfile").resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(ColorPalette.secondaryLightColor), lineWidth: 5))
                    .scaledToFit()
                    .padding()
                .shadow(radius: 10)
            }
        }
    }
}

struct PetProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        PetProfileImage(profileImg: .constant(nil))
    }
}
