//
//  ProfileViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/9/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //Defining Posts data
    
    private let posts:[Post] = [
    Post(title: "OpenAI announces ChatGPT successor GPT-4", author: "Mad Daymon", description: "The new model can respond to images - providing recipe suggestions from photos of ingredients, for example, as well as writing captions and descriptions", image: "gpt4", likes: 569, views: 1000),
    Post(title: "Apple WWDC 2023: Dates Confirmed, Countdown Begins", author: "Tim Cook", description: "Apple today announced it will host its annual Worldwide Developers Conference (WWDC) in an online format from June 5 through 9, 2023", image: "wwdc", likes: 567394, views: 657888),
    Post(title: "Google reveals its newest A.I. supercomputer, says it beats Nvidia", author: "Sergey Brin", description: "Google published details about its AI supercomputer on Wednesday, saying it is faster and more efficient than competing Nvidia systems.", image: "ggo", likes: 890999, views: 2359856),
    Post(title: "OneNote is getting Microsoft’s new AI Copilot to help you write your notes", author: "Bill Gates", description: "Copilot in OneNote can rewrite, format, or summarize your existing notes and help you create plans and more", image: "msft", likes: 12333, views: 76580)
    ]
    
    let postsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
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
    
    @objc func newButtonPressed() {
        
    }
    
    func configureUI() {
        
        navigationItem.hidesBackButton = true
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
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell()}
        cell.configure(for: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0
        {
            return ProfileHeaderView()
        }
        else {
            return UIView()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}

