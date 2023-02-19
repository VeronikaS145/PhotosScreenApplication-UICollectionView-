//
//  MediaTableViewController.swift
//  PhotosScreenApplication(UICollectionView)
//
//  Created by Nika Semenkova on 20.02.2023.
//

import UIKit

class MediaTableViewController: UIViewController {
    
    static let identifier = "MediaTableViewController"
    private var model: [[CompositionalModel]]?
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(MediaTableViewController.self, forCellReuseIdentifier: MediaTableViewController.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor  = .white
        model = CompositionalModel.photoArray
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.left.right.equalTo(view)
        }
    }
}

// MARK: - Extensions

extension MediaTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.identifier, for: indexPath) as? MediaTableViewCell
        cell?.cells = model?[indexPath.section][indexPath.row]
        return cell ?? UITableViewCell()
    }
}

extension MediaTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
