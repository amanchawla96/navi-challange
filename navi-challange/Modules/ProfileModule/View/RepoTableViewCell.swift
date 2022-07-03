//
//  RepoTableViewCell.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation
import UIKit

class RepoTableViewCell: UITableViewCell {
    
    //MARK: - Views
    private var backView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.faintWhite
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.masksToBounds = false
        return view
    }()
    
    private var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 16)
        lbl.textColor = AppColors.primaryLabel
        return lbl
    }()
    
    private var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 16)
        lbl.textColor = AppColors.secondaryLabel
        return lbl
    }()
    
    private var languageView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primary
        view.layer.cornerRadius = 8
        return view
    }()
    
    private var langaugeLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 14)
        lbl.textColor = AppColors.secondaryLabel
        return lbl
    }()
    
    private var langaugeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
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
    
    //MARK: - Setup subviews
    private func setupSubviews() {
        addSubview(backView)
        
        addConstraint(with: "H:|-12-[v0]-12-|", views: backView)
        addConstraint(with: "V:|-8-[v0]-8-|", views: backView)
        
        backView.addSubview(titleLbl)
        backView.addSubview(dateLbl)
        backView.addSubview(langaugeStack)
        
        backView.addConstraint(with: "H:|-16-[v0]-8-[v1]-16-|", views: titleLbl, dateLbl)
        backView.addConstraint(with: "H:|-16-[v0]", views: langaugeStack)
        
        dateLbl.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor).isActive = true
        
        backView.addConstraint(with: "V:|-8-[v0]-4-[v1]-8-|", views: titleLbl, langaugeStack)

        langaugeStack.addArrangedSubview(languageView)
        langaugeStack.addArrangedSubview(langaugeLbl)
        
        langaugeStack.addConstraint(with: "H:[v0(16)]", views: languageView)
        langaugeStack.addConstraint(with: "V:[v0(16)]", views: languageView)
    }
    
    //MARK: - Populate
    func populate(viewModel: RepoVM) {
        titleLbl.text = viewModel.title
        
        dateLbl.text = viewModel.createdAt.timeAgoDisplay()
        
        langaugeLbl.text = viewModel.language
    }
}
