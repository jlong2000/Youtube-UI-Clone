//
//  HomeViewController.swift
//  Momentum
//
//  Created by Jiang Long on 3/21/21.
//

import UIKit

class HomeViewController: UIViewController {

  // MARK: - Private Variables
  private var collections: [Collection] = []

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
    let selectView = SearchTypeSelectView(["Collections", "Challenges"])
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
    tableView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellReuseIdentifier: CollectionCell.identifier)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  override var preferredStatusBarStyle: UIStatusBarStyle { .darkContent }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    loadCollections()
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

  private func loadCollections() {
    // load the dummy data
    collections.removeAll()
    collections.append(Collection(logoURL: nil, name: "Fresh Energy", lessons: Array(repeating: Lesson(id: 0, name: ""), count: 5)))
    collections.append(Collection(logoURL: nil, name: "Breath of Fire", lessons: Array(repeating: Lesson(id: 0, name: ""), count: 10)))
    collections.append(Collection(logoURL: nil, name: "Winds of Change", lessons: Array(repeating: Lesson(id: 0, name: ""), count: 0)))
    collections.append(Collection(logoURL: nil, name: "Finding your Place", lessons: Array(repeating: Lesson(id: 0, name: ""), count: 1)))
    collections.append(Collection(logoURL: nil, name: "Jiang Long", lessons: Array(repeating: Lesson(id: 0, name: ""), count: 2)))
    tableView.reloadData()
  }
}

// MARK: - SearchTypeSelectViewDelegate

extension HomeViewController: SearchTypeSelectViewDelegate {
  func didSelect(at index: Int) {
    
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return collections.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CollectionCell.identifier, for: indexPath) as! CollectionCell
    cell.configure(with: collections[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(collections[indexPath.row].name, "Tapped")
  }
}
