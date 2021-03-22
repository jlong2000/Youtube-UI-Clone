//
//  DiscoverViewController.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class DiscoverViewController: UIViewController {

  // MARK: - Private Variables
  private var classes: [Class] = []
  
  // MARK: - UI Components
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.openSansFont(ofSize: 16, weight: .bold)
    label.textColor = .black
    label.text = "Momentum"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let searchTextField: SearchTextField = {
    let searchTextField = SearchTextField()
    searchTextField.translatesAutoresizingMaskIntoConstraints = false
    return searchTextField
  }()

  private lazy var searchTypeSelectView: SearchTypeSelectView = {
    let selectView = SearchTypeSelectView(["Discover Classes", "Discover Challenges"])
    selectView.delegate = self
    selectView.translatesAutoresizingMaskIntoConstraints = false
    return selectView
  }()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 21, right: 0)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "ClassCell", bundle: nil), forCellReuseIdentifier: ClassCell.identifier)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  override var preferredStatusBarStyle: UIStatusBarStyle { .darkContent }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
    loadClasses()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tableView.reloadData()
  }

  // MARK: - Private Functions

  private func setupUI() {

    view.backgroundColor = .white
    view.addSubview(titleLabel)
    view.addSubview(searchTextField)
    view.addSubview(searchTypeSelectView)
    view.addSubview(tableView)

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 41),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
      searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
      searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
      searchTextField.heightAnchor.constraint(equalToConstant: 42),

      searchTypeSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
      searchTypeSelectView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 14),
      searchTypeSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
      searchTypeSelectView.heightAnchor.constraint(equalToConstant: 39),

      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.topAnchor.constraint(equalTo: searchTypeSelectView.bottomAnchor, constant: 11),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  private func loadClasses() {
    // load the dummy data
    classes.removeAll()
    classes.append(Class(id: 0, title: "10-Minute Positive Mindset", subtitle: "Allie Gross + Mindset", videoURL: nil, startTime: Date(timeIntervalSinceNow: -10), endTime: Date(timeIntervalSinceNow: 10)))
    classes.append(Class(id: 0, title: "Mindset Picks", subtitle: "5-Minute Zoom Mindset Refresh", videoURL: nil, startTime: Date(timeIntervalSinceNow: 10), endTime: Date(timeIntervalSinceNow: 10000)))
    classes.append(Class(id: 0, title: "Smarter Thinking Picks", subtitle: "8-Minute Focus Training", videoURL: nil, startTime: Date(timeIntervalSinceNow: 10 * 60), endTime: Date(timeIntervalSinceNow: 24 * 3600)))
    classes.append(Class(id: 0, title: "Jiang’s Picks", subtitle: "10-Minute Masterclass", videoURL: nil, startTime: Date(timeIntervalSinceNow: 24 * 3600), endTime: Date(timeIntervalSinceNow: 24 * 3600 + 600)))
    classes.append(Class(id: 0, title: "Test", subtitle: "10-Minute Test", videoURL: nil, startTime: Date(timeIntervalSinceNow: 48 * 3600), endTime: Date(timeIntervalSinceNow: 48 * 3600)))

    tableView.reloadData()
  }
}

// MARK: - SearchTypeSelectViewDelegate

extension DiscoverViewController: SearchTypeSelectViewDelegate {
  func didSelect(at index: Int) {

  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return classes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ClassCell.identifier, for: indexPath) as! ClassCell
    cell.configure(with: classes[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(classes[indexPath.row].title, "Tapped")
  }
}
