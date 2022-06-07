//
//  Color.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 7.06.2022.
//

import Foundation
import UIKit

//MARK: - Dark Mode Colors
class Color {
    //White color for dark mode -  Black  color for light mode
    public static var appWhite: UIColor = {
      if #available(iOS 13, *) {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
          if UITraitCollection.userInterfaceStyle == .dark { //Dark Mode
              return .white
          } else {// Light Mode
              return .black
          }
        }
      } else { //iOS 12 and lower.
        return .white
      }
    }()
      
      ///White color for light mode -  Black color for dark mode
      public static var appBlack: UIColor = {
        if #available(iOS 13, *) {
          return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark { //Dark Mode
              return .black
            } else {// Light Mode
              return .white
            }
          }
        } else { //iOS 12 and lower.
          return .black
        }
      }()
}
