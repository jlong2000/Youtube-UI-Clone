//
//  UIColor+Extension.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

extension UIColor {

  public convenience init?(hex: String) {
    let r, g, b, a: CGFloat
    assert(hex.hasPrefix("#"), "Need to begin with #")

    let start = hex.index(hex.startIndex, offsetBy: 1)
    let hexColor = String(hex[start...])

    assert(hexColor.count == 8, "Hex numbers should be 8-digits")

    let scanner = Scanner(string: hexColor)
    var hexNumber: UInt64 = 0

    assert(scanner.scanHexInt64(&hexNumber), "Failed to scan hex")

    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
    a = CGFloat(hexNumber & 0x000000ff) / 255

    self.init(red: r, green: g, blue: b, alpha: a)
    return
  }

  /// #C2221C
  static let appRed   = UIColor(hex: "#C2221CFF")!
  /// #6A6A6A
  static let appGray  = UIColor(hex: "#6A6A6AFF")!
}
