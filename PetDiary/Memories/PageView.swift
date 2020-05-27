//
//  PageView.swift
//  PetDiary
//
//  Created by Ines Pacheco on 25/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0)}
    }
    
    
    
    
    var body: some View {
        ZStack {
            PageViewController(currentPage: $currentPage, controllers: viewControllers)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
    
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(PetData().petMemories.map{ FeatureCard(petMemory: $0)})
            .aspectRatio(3/2, contentMode: .fit)
        
//        .aspectRatio(3/2, contentMode: .fit)
    }
}
