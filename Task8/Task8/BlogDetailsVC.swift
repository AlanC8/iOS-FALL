//
//  BlogDetailsVC.swift
//  Task8
//
//  Created by Алан Абзалханулы on 14.11.2024.
//


import UIKit

class BlogDetailsVC: UIViewController {
    
    var blogImageView = UIImageView()
    var blogTitleLabel = UILabel()
    var blogAuthorLabel = UILabel()
    var blogTextView = UITextView()
    
    var blog: Blog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        setConstraints()
    }
    
    private func configureView() {
        guard let blog = blog else { return }
        
        blogImageView.image = blog.image
        blogTitleLabel.text = blog.title
        blogTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        blogAuthorLabel.text = "Author: \(blog.author)"
        blogAuthorLabel.font = UIFont.systemFont(ofSize: 16)
        
        blogTextView.text = blog.text
        blogTextView.isEditable = false
        blogTextView.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(blogImageView)
        view.addSubview(blogTitleLabel)
        view.addSubview(blogAuthorLabel)
        view.addSubview(blogTextView)
    }
    
    private func setConstraints() {
        blogImageView.translatesAutoresizingMaskIntoConstraints = false
        blogTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        blogAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        blogTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blogImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            blogImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blogImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            blogImageView.heightAnchor.constraint(equalTo: blogImageView.widthAnchor, multiplier: 9/16),
            
            blogTitleLabel.topAnchor.constraint(equalTo: blogImageView.bottomAnchor, constant: 12),
            blogTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blogTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            blogAuthorLabel.topAnchor.constraint(equalTo: blogTitleLabel.bottomAnchor, constant: 8),
            blogAuthorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blogAuthorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            blogTextView.topAnchor.constraint(equalTo: blogAuthorLabel.bottomAnchor, constant: 12),
            blogTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blogTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            blogTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
