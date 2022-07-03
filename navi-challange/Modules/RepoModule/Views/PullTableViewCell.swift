//
//  PullTableViewCell.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation
import UIKit

class PullTableViewCell: UITableViewCell {
    
    //MARK: - Views
    private var stateImageView: UIImageView = {
        let view = UIImageView()
        view.image = AppImages.merge
        return view
    }()
    
    private var repoTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.medium.with(size: 14)
        lbl.textColor = AppColors.secondaryLabel
        return lbl
    }()
    
    private var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 16)
        lbl.textColor = AppColors.primaryLabel
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.medium.with(size: 14)
        lbl.textColor = AppColors.secondaryLabel
        return lbl
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Subviews
    private func setupSubviews() {
        addSubview(stateImageView)
        addSubview(repoTitle)
        addSubview(dateLbl)
        
        addSubview(titleLbl)
        
        addConstraint(with: "H:|-16-[v0(24)]-8-[v1]-8-[v2]-16-|", views: stateImageView, repoTitle, dateLbl)
        
        addConstraint(with: "V:[v0(24)]", views: stateImageView)
        
        addConstraint(with: "V:|-8-[v0]-8-[v1]-8-|", views: repoTitle, titleLbl)
        
        dateLbl.centerYAnchor.constraint(equalTo: repoTitle.centerYAnchor).isActive = true
        stateImageView.centerYAnchor.constraint(equalTo: repoTitle.centerYAnchor).isActive = true
        
        addConstraint(with: "H:[v0]-16-|", views: titleLbl)
        titleLbl.leadingAnchor.constraint(equalTo: repoTitle.leadingAnchor).isActive = true
    }
    
    //MARK: - Populate
    func populate(viewModel: PullsCellVM) {
        repoTitle.text = viewModel.repoTitle
        
        titleLbl.text = viewModel.title
        
        dateLbl.text = viewModel.createdAt.timeAgoDisplay()
    }
}
