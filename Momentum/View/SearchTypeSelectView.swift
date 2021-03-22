//
//  SearchTypeSelectView.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

protocol SearchTypeSelectViewDelegate: AnyObject {
  func didSelect(at index: Int)
}

class SearchTypeSelectView: UIControl {

  // MARK: - Public Variables
  weak var delegate: SearchTypeSelectViewDelegate?
  private var indicatorLeadingConstraints: [NSLayoutConstraint] = []
  private var indicatorTrailingConstraints: [NSLayoutConstraint] = []

  // MARK: - Private Variables
  private let types: [String]
  private(set) var selectedIndex: Int = 0 {
    didSet {
      print(types[selectedIndex], "Selected")

      selectType(at: selectedIndex)
      delegate?.didSelect(at: selectedIndex)
    }
  }

  // MARK: - UI Components
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually

    indicatorLeadingConstraints = []
    indicatorTrailingConstraints = []

    for (index, type) in types.enumerated() {
      let button = UIButton()
      button.setAttributedTitle(NSAttributedString(string: type,
                                                   attributes: [.font: UIFont.openSansFont(ofSize: 13),
                                                                .foregroundColor: UIColor.appGray]),
                                for: .normal)
      button.setAttributedTitle(NSAttributedString(string: type,
                                                   attributes: [.font: UIFont.openSansFont(ofSize: 13, weight: .bold),
                                                                .foregroundColor: UIColor.appRed]),
                                for: .selected)
      button.tag = index
      button.isSelected = index == 0
      button.addTarget(self, action: #selector(handleTypeButtonTap(_:)), for: .touchUpInside)

      stackView.addArrangedSubview(button)
      indicatorLeadingConstraints.append(indicatorBar.leadingAnchor.constraint(equalTo: button.leadingAnchor))
      indicatorTrailingConstraints.append(indicatorBar.trailingAnchor.constraint(equalTo: button.trailingAnchor))
    }

    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  private let indicatorBar: UIView = {
    let view = UIView()
    view.backgroundColor = .appRed
    view.layer.cornerRadius = 1.5
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  // MARK: - Initializer
  init(_ types: [String]) {
    assert(types.count >= 2, "Unfortunately the number of the types is less than two.")
    self.types = types

    super.init(frame: .zero)

    setupUI()
    selectedIndex = 0
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Functions
  private func setupUI() {
    addSubview(stackView)
    addSubview(indicatorBar)

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

      indicatorLeadingConstraints.first!,
      indicatorBar.topAnchor.constraint(equalTo: stackView.bottomAnchor),
      indicatorTrailingConstraints.first!,
      indicatorBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      indicatorBar.heightAnchor.constraint(equalToConstant: 3),
    ])
  }

  private func selectType(at index: Int) {
    stackView.arrangedSubviews.forEach { button in
      guard let typeButton = button as? UIButton else { return }
      typeButton.isSelected = (typeButton.tag == index)
    }

    indicatorLeadingConstraints.forEach({ $0.isActive = false })
    indicatorLeadingConstraints[index].isActive = true

    indicatorTrailingConstraints.forEach({ $0.isActive = false })
    indicatorTrailingConstraints[index].isActive = true

    UIView.animate(withDuration: 0.2) {
      self.layoutIfNeeded()
    }
  }

  // MARK: - Actions
  @objc private func handleTypeButtonTap(_ button: UIButton) {
    selectedIndex = button.tag
  }
}
