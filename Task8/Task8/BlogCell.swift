//
//  BlogCell.swift
//  Task8
//
//  Created by Алан Абзалханулы on 14.11.2024.
//


import UIKit

class BlogCell: UITableViewCell {
    
    var blogImageView = UIImageView()
    var blogTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(blogImageView)
        addSubview(blogTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(blog: Blog) {
        blogImageView.image = blog.image
        blogTitleLabel.text = blog.title
    }
    
    private func configureImageView() {
        blogImageView.layer.cornerRadius = 10
        blogImageView.clipsToBounds = true
    }
    
    private func configureTitleLabel() {
        blogTitleLabel.numberOfLines = 0
        blogTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setImageConstraints() {
        blogImageView.translatesAutoresizingMaskIntoConstraints = false
        blogImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        blogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        blogImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        blogImageView.widthAnchor.constraint(equalTo: blogImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func setTitleConstraints() {
        blogTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        blogTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        blogTitleLabel.leadingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: 20).isActive = true
        blogTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
