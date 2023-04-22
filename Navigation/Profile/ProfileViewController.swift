//
//  ProfileViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/9/23.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let postsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.reuseIdentifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 850
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureUI() {
        
        navigationItem.hidesBackButton = true
        
        #if DEBUG
        view.backgroundColor = .blue
        #else
        view.backgroundColor = .red
        #endif
        
        postsTable.delegate = self
        postsTable.dataSource = self
        
        view.addSubview(postsTable)
        
        NSLayoutConstraint.activate(
            [
                postsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                postsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                postsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                postsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        
    }
        
    }
    

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return Post.posts.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.reuseIdentifier, for: indexPath) as? PhotosTableViewCell else { return UITableViewCell() }
            return cell
        }
        else  {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell()}
            cell.configure(for: Post.posts[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0
        {
            return ProfileHeaderView()
        }
        else
        {
            return UIView()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 200
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return (view.frame.size.width - 48) / 4 + 50
        }
        else
        {
            return tableView.rowHeight
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PhotosViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            return
        }
    }
}

