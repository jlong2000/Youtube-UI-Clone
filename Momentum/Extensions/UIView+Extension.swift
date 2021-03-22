//
//  UIView+Extension.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

extension UIView {

  static let blinkAnimationKey = "opacity"

  func beginBlink() {
    let blink = CABasicAnimation(keyPath: UIView.blinkAnimationKey)
    blink.duration = 0.5
    blink.fromValue = 1
    blink.toValue = 0.1
    blink.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    blink.autoreverses = true
    blink.repeatCount = Float.infinity

    let diff = Date().timeIntervalSince1970 - Double(Int(Date().timeIntervalSince1970))
    DispatchQueue.main.asyncAfter(deadline: .now() + diff) {
      // this needs to synchronize the blink animation on several views
      self.layer.add(blink, forKey: UIView.blinkAnimationKey)
    }
  }

  func endBlink() {
    layer.removeAnimation(forKey: UIView.blinkAnimationKey)
  }

  func isBlinking() -> Bool {
    return layer.animationKeys()?.contains(UIView.blinkAnimationKey) ?? false
  }
}
