//
//  BlogListVC.swift
//  Task8
//
//  Created by Алан Абзалханулы on 14.11.2024.
//


import UIKit

class BlogListVC: UIViewController {
    
    var tableView = UITableView()
    var blogs: [Blog] = Blog.sampleData()
    
    struct Cells {
        static let blogCell = "BlogCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(BlogCell.self, forCellReuseIdentifier: Cells.blogCell)
        tableView.pin(to: view)
        title = "Blogs"
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BlogListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.blogCell) as! BlogCell
        let blog = blogs[indexPath.row]
        cell.set(blog: blog)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = BlogDetailsVC()
        detailsVC.blog = blogs[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
