//
//  ProfileTableViewCell.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    //MARK: - Views
    private var userImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 24)
        lbl.textColor = AppColors.primaryLabel
        return lbl
    }()
    
    private var usernameLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.semibold.with(size: 20)
        lbl.textColor = AppColors.secondaryLabel
        return lbl
    }()
    
    private var userStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    private var followingLbl: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    private var followersLbl: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    private var followStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.secondaryLabel
        return view
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Subviews
    private func setupSubviews() {
        addSubview(userImageView)
        addSubview(userStack)
        addSubview(followStack)
        addSubview(separatorView)
        
        addConstraint(with: "H:|-16-[v0(80)]-12-[v1]-16-|", views: userImageView, userStack)
        addConstraint(with: "H:|-16-[v0]-(>=16)-|", views: followStack)
        addConstraint(with: "H:|-16-[v0]-16-|", views: separatorView)
        
        addConstraint(with: "V:|-8-[v0(80)]-12-[v1]-8-[v2(1)]|", views: userImageView, followStack, separatorView)
        
        userStack.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
        
        userStack.addArrangedSubview(nameLbl)
        userStack.addArrangedSubview(usernameLbl)
        
        followStack.addArrangedSubview(followersLbl)
        followStack.addArrangedSubview(followingLbl)
    }
    
    //MARK: - Populate
    func populate(viewModel: UserVM) {
        userImageView.setImage(for: viewModel.image, with: AppImages.profilePlaceholder)
        
        nameLbl.text = viewModel.name
        
        usernameLbl.text = viewModel.username
        
        followingLbl.attributedText = populateFollow(with: viewModel.following, for: "Following")
        
        followersLbl.attributedText = populateFollow(with: viewModel.followers, for: "Followers")
    }
    
    private func populateFollow(with count: Int, for string: String) -> NSMutableAttributedString {
        let primaryAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: AppColors.primaryLabel, .font: AppFonts.medium.with(size: 16)]
        let secondaryAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: AppColors.secondaryLabel, .font: AppFonts.regular.with(size: 16)]
        
        let countString = NSMutableAttributedString(string: "\(count)", attributes: primaryAttributes)
        let string = NSAttributedString(string: " \(string)", attributes: secondaryAttributes)
        
        countString.append(string)
        return countString
    }
}
