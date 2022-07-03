//
//  RepoVC.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation
import UIKit

class RepoVC: UIViewController {
    
    //MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = AppColors.background
        tableView.sectionHeaderTopPadding = .zero
        
        tableView.register(with: PullTableViewCell.self)
        
        return tableView
    }()
    
    //MARK: - Variables & Constents
    var viewModel: RepoVM!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        view.backgroundColor = AppColors.background
        
        title = viewModel.repoName
        
        setupSubviews()
    }
    
    //MARK: - Setup subview
    private func setupSubviews() {
        view.addSubview(tableView)
        view.addConstraint(with: "H:|[v0]|", views: tableView)
        view.addConstraint(with: "V:|[v0]|", views: tableView)
    }
}

//MARK: - TableView Datasource & delegate
extension RepoVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPulls
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withIdentifier: PullTableViewCell.self, indexPath: indexPath)
        cell.populate(viewModel: viewModel.createPullCellVM(for: indexPath))
        return cell
    }
    
}

extension RepoVC: RepoVMDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
