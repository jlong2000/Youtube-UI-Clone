//
//  CollectionCell.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class CollectionCell: UITableViewCell {

  static let identifier = "CollectionCell"

  // MARK: - UI Components
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!

  // MARK: - Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()

    setupUI()
  }

  // MARK: - Private Functions
  private func setupUI() {
    backgroundColor = .clear
    selectionStyle = .none

    logoImageView.backgroundColor = UIColor(hex: "#C4C4C4FF")
    logoImageView.layer.cornerRadius = 10

    nameLabel.font = .openSansFont(ofSize: 14, weight: .bold)
    nameLabel.numberOfLines = 0
    nameLabel.textColor = .appRed

    countLabel.font = .openSansFont(ofSize: 14)
    countLabel.textColor = .appGray
  }

  // MARK: - Public Functions
  internal func configure(with collection: Collection) {
    nameLabel.text = collection.name
    let lessonCount = collection.lessons.count
    if lessonCount > 1 {
      countLabel.text = "\(lessonCount) Lessons"
    } else {
      countLabel.text = "\(lessonCount) Lesson"
    }
  }
}
