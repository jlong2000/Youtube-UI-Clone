//
//  UIFont+Extension.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

extension UIFont {
  static func openSansFont(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
    switch weight {
    case .light:
      guard let font = UIFont(name: "OpenSans-Light", size: size) else {
        assertionFailure("Cannot find font: OpenSans-Light")
        return .systemFont(ofSize: size, weight: weight)
      }
      return font
    case .regular:
      guard let font = UIFont(name: "OpenSans-Regular", size: size) else {
        assertionFailure("Cannot find font: OpenSans-Regular")
        return .systemFont(ofSize: size, weight: weight)
      }
      return font
    case .semibold:
      guard let font = UIFont(name: "OpenSans-SemiBold", size: size) else {
        assertionFailure("Cannot find font: OpenSans-SemiBold")
        return .systemFont(ofSize: size, weight: weight)
      }
      return font
    case .bold:
      guard let font = UIFont(name: "OpenSans-Bold", size: size) else {
        assertionFailure("Cannot find font: OpenSans-Bold")
        return .systemFont(ofSize: size, weight: weight)
      }
      return font
    case .black:
      guard let font = UIFont(name: "OpenSans-ExtraBold", size: size) else {
        assertionFailure("Cannot find font: OpenSans-ExtraBold")
        return .systemFont(ofSize: size, weight: weight)
      }
      return font
    default:
      assertionFailure("Cannot find font weight: OpenSans-\(weight)")
      return .systemFont(ofSize: size, weight: weight)
    }
  }
}
