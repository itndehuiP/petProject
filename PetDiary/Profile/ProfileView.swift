//
//  ContentView.swift
//  PetDiary
//
//  Created by Ines Pacheco on 17/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI




struct ProfileView: View {
    @EnvironmentObject var petData: PetData
    @State var draftProfile = PetProfile.default
    @Environment(\.editMode) var mode
    @State var showingImagePicker =  false
    @State var inputImage: UIImage?
    @State var image: Image?
    
    var body: some View {
        
        VStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color(ColorPalette.secondaryColor), Color(ColorPalette.primaryLightColor)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Text(draftProfile.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(ColorPalette.secondaryDarkColor))
                        .padding()
                        .offset(CGSize(width: 0, height: 30))
                    PetProfileImage(profileImg: $image)
                        .onTapGesture {
                            if self.mode?.wrappedValue == .active {
                                self.showingImagePicker.toggle()
                            }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showingImagePicker, onDismiss: self.loadImage){
                    ImagePicker(image: self.$inputImage)
            }
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.petData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(petProfile: petData.profile)
            } else {
                PetProfileEditor(petProfile: $draftProfile)
                .onAppear() {
                    self.draftProfile = self.petData.profile
                }
                .onDisappear() {
                    self.petData.profile = self.draftProfile
                }
            }
            
        }
    }
    func loadImage(){
        guard let img = inputImage else { return }
        image = Image(uiImage: img)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(PetData())
    }
}
