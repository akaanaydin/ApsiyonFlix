//
//  NavigationBar + Extension.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation
import UIKit

//MARK: - Navigation Controller Extension
extension UIViewController {
    // Configure Navigation Bar
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.backgroundColor = backgoundColor
            navBarAppearance.shadowColor = nil
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
            
            
        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.barTintColor = backgoundColor
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.isTranslucent = false
            navigationItem.title = title
        }
    }
    
    // Present New View Controller
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let navController = UINavigationController(rootViewController: viewControllerToPresent)
        navController.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.navigationController?.present(navController, animated: false, completion: nil)
    }
    // Dismiss View Controller
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
