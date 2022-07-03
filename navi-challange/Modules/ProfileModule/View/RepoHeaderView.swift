//
//  RepoHeaderView.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation
import UIKit

class RepoHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Views
    private let headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.text.square")
        imageView.tintColor = AppColors.secondaryLabel
        return imageView
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 18)
        lbl.textColor = AppColors.secondaryLabel
        lbl.text = "Repositories"
        return lbl
    }()
    
    //MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setupSubviews() {
        addSubview(headerImage)
        addSubview(titleLbl)
        
        addConstraint(with: "H:|-16-[v0(18)]-8-[v1]-16-|", views: headerImage, titleLbl)
        addConstraint(with: "V:|-4-[v0]-4-|", views: titleLbl)
        addConstraint(with: "V:[v0(18)]", views: headerImage)
        
        headerImage.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor).isActive = true
    }
}
