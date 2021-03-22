//
//  ClassCell.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class ClassCell: UITableViewCell {

  static let identifier = "ClassCell"

  // MARK: - Private Variables
  private var _class: Class?

  // MARK: - UI Components
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var liveView: UIView!
  @IBOutlet weak var dotView: UIView!
  @IBOutlet weak var liveLabel: UILabel!
  @IBOutlet weak var videoThumbnail: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var statusViewTopConstraint: UIView!
  @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!

  // MARK: - Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()

    setupUI()
  }

  override func prepareForReuse() {
    dotView.endBlink()
    dotView.beginBlink()
  }

  // MARK: - Private Functions
  private func setupUI() {
    backgroundColor = .clear
    selectionStyle = .none

    containerView.backgroundColor = .clear
    containerView.layer.cornerRadius = 10
    containerView.layer.borderColor = UIColor(hex: "#EAEAEAFF")?.cgColor
    containerView.layer.borderWidth = 1

    liveView.backgroundColor = .clear
    dotView.layer.cornerRadius = 4
    dotView.backgroundColor = .appRed
    liveLabel.font = .openSansFont(ofSize: 9, weight: .black)
    liveLabel.text = "LIVE"
    liveLabel.textColor = .appRed

    videoThumbnail.backgroundColor = UIColor(hex: "#C4C4C4FF")
    videoThumbnail.backgroundColor = .appGray
    videoThumbnail.layer.cornerRadius = 10

    titleLabel.font = .openSansFont(ofSize: 14, weight: .bold)
    titleLabel.numberOfLines = 0
    titleLabel.textColor = .appRed

    subtitleLabel.font = .openSansFont(ofSize: 12)
    subtitleLabel.numberOfLines = 0
    subtitleLabel.textColor = .appGray

    timeLabel.font = .openSansFont(ofSize: 12)
    timeLabel.textColor = .appGray
  }

  // MARK: - Public Functions
  internal func configure(with _class: Class) {

    let now = Date()
    liveView.isHidden = (_class.startTime > now || _class.endTime < now)
    if (_class.startTime < now && _class.endTime > now) {
      liveView.isHidden = false
      if !dotView.isBlinking() {
        dotView.beginBlink()
      }
      titleLabelTopConstraint.constant = 35
    } else {
      liveView.isHidden = true
      titleLabelTopConstraint.constant = 26
    }

    titleLabel.text = _class.title
    subtitleLabel.text = _class.subtitle

    let calendar = Calendar.current
    let timezone = calendar.timeZone.localizedName(for: .shortGeneric, locale: .current) ?? "ET"
    let dateFormatter = DateFormatter()

    if _class.startTime > now {
      // if scheduled later
      if calendar.isDateInToday(_class.startTime) {
        // if the class is scheduled today
        dateFormatter.dateFormat = "'Starting at 'h:mm a '\(timezone)'"
      } else {
        // if the class is scheduled after today
        let daySuffix = _class.startTime.daySuffix()
        dateFormatter.dateFormat = "MMMM d'\(daySuffix)' 'at' h:mm a '\(timezone)'"
      }
      timeLabel.text = dateFormatter.string(from: _class.startTime)
    } else if _class.endTime > now {
      // if the class is live currently
      dateFormatter.dateFormat = "'Ending at 'h:mm a '\(timezone)'"
      timeLabel.text = dateFormatter.string(from: _class.endTime)
    } else {
      // if the class ended
      if calendar.isDateInToday(_class.startTime) {
        // if the class has been ended today
        dateFormatter.dateFormat = "'Ended at 'h:mm a '\(timezone)'"
      } else {
        // if the class has been ended before today
        let daySuffix = _class.startTime.daySuffix()
        dateFormatter.dateFormat = "'Ended 'MMMM d'\(daySuffix)' 'at' h:mm a '\(timezone)'"
      }
      timeLabel.text = dateFormatter.string(from: _class.endTime)
    }
  }
}
