//
//  PageViewController.swift
//  PetDiary
//
//  Created by Ines Pacheco on 24/05/20.
//  Copyright © 2020 Ines Pacheco. All rights reserved.
//

import SwiftUI
import UIKit


struct PageViewController: UIViewControllerRepresentable {
    
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    var controllers: [UIViewController]

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                           return nil
                       }
                       if index == 0 {
                           return parent.controllers.last
                       }
                       return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibleVC = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleVC) {
                parent.currentPage = index
            }
        }
        
    }
}
