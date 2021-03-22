//
//  ProfileViewController.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class ProfileViewController: UIViewController {

  // MARK: - UI Components

  override var preferredStatusBarStyle: UIStatusBarStyle { .darkContent }

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

  // MARK: - Private Functions

  private func setupUI() {
    view.backgroundColor = .white
  }
}
