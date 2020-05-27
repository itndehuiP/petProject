//
//  PetMemoryImage.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct PetMemoryImage: View {
    let imageName: String
    var body: some View {
        HStack {
            Image("occiProfile").resizable()
            .clipShape(Rectangle())
            .scaledToFit()
                .padding()
                .border(Color(ColorPalette.secondaryLightColor), width: 2)
            .cornerRadius(5)
        }
        .padding()
    }
}

struct PetMemoryImage_Previews: PreviewProvider {
    static var previews: some View {
        PetMemoryImage(imageName: "occiProfile")
    }
}
