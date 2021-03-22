//
//  SearchTextField.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class SearchTextField: UIControl {

  // MARK: - UI Components
  private let searchIcon: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "icon_search"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private lazy var textField: UITextField = {
    let textField = UITextField()
    let placeholderAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.openSansFont(ofSize: 14),
      .foregroundColor: UIColor.appGray
    ]
    textField.attributedPlaceholder = NSAttributedString(string: "Find your calling…", attributes: placeholderAttributes)
    textField.delegate = self
    textField.font = .openSansFont(ofSize: 14)
    textField.returnKeyType = .search
    textField.clearButtonMode = .whileEditing
    textField.textColor = .black
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  // MARK: - Initializer
  init() {
    super.init(frame: .zero)

    setupUI()

    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Functions
  private func setupUI() {
    backgroundColor = UIColor(hex: "#F4F4F4FF")
    layer.cornerRadius = 5

    addSubview(searchIcon)
    addSubview(textField)

    NSLayoutConstraint.activate([
      searchIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
      searchIcon.widthAnchor.constraint(equalToConstant: 16),
      searchIcon.heightAnchor.constraint(equalToConstant: 16),
      searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),

      textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 13),
      textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
    ])
  }

  // MARK: - Actions
  @objc private func handleTapGesture() {
    textField.becomeFirstResponder()
  }
}


// MARK: - UITextFieldDelegate

extension SearchTextField: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    endEditing(true)
  }
}
