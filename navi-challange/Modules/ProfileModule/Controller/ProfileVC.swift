//
//  ProfileVC.swift
//  navi-challange
//
//  Created by Aman Chawla on 01/07/22.
//

import UIKit

class ProfileVC: UIViewController {

    //MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = AppColors.background
        tableView.sectionHeaderTopPadding = .zero
        
        tableView.register(with: ProfileTableViewCell.self)
        tableView.register(with: RepoTableViewCell.self)
        
        tableView.registerHeaderFooterView(with: RepoHeaderView.self)
        
        return tableView
    }()
    
    //MARK: - Variables & Constents
    var viewModel: ProfileVM!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        view.backgroundColor = AppColors.background
        
        setupSubviews()
    }

    //MARK: - Setup Subviews
    private func setupSubviews() {
        view.addSubview(tableView)
        
        view.addConstraint(with: "H:|[v0]|", views: tableView)
        view.addConstraint(with: "V:|[v0]|", views: tableView)
    }
}

//MARK: - TableView Datasource & delegate
extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return viewModel.numberofRepos
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 1 else { return .zero }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        let cell = tableView.dequeueHeaderFooterView(with: RepoHeaderView.self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueCell(withIdentifier: ProfileTableViewCell.self, indexPath: indexPath)
            guard let viewModel = viewModel.createUserVM() else { return cell }
            cell.populate(viewModel: viewModel)
            return cell
        default:
            let cell = tableView.dequeueCell(withIdentifier: RepoTableViewCell.self, indexPath: indexPath)
            cell.populate(viewModel: viewModel.createRepoVM(for: indexPath))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        viewModel.openRepo(at: indexPath)
    }
}

extension ProfileVC: ProfileVMDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension ProfileVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top)
        self.title = offsetY > -40  ? viewModel.name : ""
    }
    
}
