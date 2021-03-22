//
//  TabBarViewController.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class TabBarViewController: UITabBarController {

  // MARK: - UI Components
  private let homeVC: HomeViewController = {
    let vc = HomeViewController(nibName: nil, bundle: nil)
    vc.tabBarItem = UITabBarItem(title: "For You", image: UIImage(named: "icon_launch"), selectedImage: UIImage(named: "icon_launch"))
    return vc
  }()

  private let discoverVC: DiscoverViewController = {
    let vc = DiscoverViewController(nibName: nil, bundle: nil)
    vc.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "icon_discover"), selectedImage: UIImage(named: "icon_discover"))
    return vc
  }()

  private let connectVC: ConnectViewController = {
    let vc = ConnectViewController(nibName: nil, bundle: nil)
    vc.tabBarItem = UITabBarItem(title: "Connect", image: UIImage(named: "icon_connect"), selectedImage: UIImage(named: "icon_connect"))
    return vc
  }()

  private let profileVC: ProfileViewController = {
    let vc = ProfileViewController(nibName: nil, bundle: nil)
    vc.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "icon_avatar"), selectedImage: UIImage(named: "icon_avatar"))
    return vc
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setViewControllers([homeVC, discoverVC, connectVC, profileVC], animated: false)
    tabBar.barTintColor = .white
    tabBar.tintColor = .appRed
    tabBar.unselectedItemTintColor = .appGray
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage(color: .white)
    tabBar.layer.shadowColor = UIColor.black.cgColor
    tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
    tabBar.layer.shadowOpacity = 0.04
    tabBar.layer.shadowRadius = 4
  }
}
