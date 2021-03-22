//
//  Date+Extension.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import Foundation

extension Date {
  func daySuffix() -> String {
    let calendar = Calendar.current
    let components = (calendar as NSCalendar).components(.day, from: self)
    let dayOfMonth = components.day
    switch dayOfMonth {
    case 1, 21, 31:
      return "st"
    case 2, 22:
      return "nd"
    case 3, 23:
      return "rd"
    default:
      return "th"
    }
  }
}
