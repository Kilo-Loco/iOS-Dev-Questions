//
//  QuestionsViewController.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class QuestionsViewController: UITableViewController {

    // MARK: - Communication
    
    /// Called when topics/questions should be retrieved
    var getTopics: EmptyClosure?
    
    
    // MARK: - Injected Properties
    
    let mainTableView: QuestionsView
    var topics: [Topic]
    
    
    // MARK: - Initializers
    
    init(mainTableView: QuestionsView = .init(), topics: [Topic] = .init()) {
        self.mainTableView = mainTableView
        self.topics = topics
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    override func loadView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        view = mainTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopics?()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return topics.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics[section].questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.identifier, for: indexPath)
        
        let topic = topics[indexPath.section]
        let question = topic.questions[indexPath.row]
        populate(cell, with: question)
        
        return cell
    }
    
    /// Takes a UITableViewCell and tries to cast it as a QuestionCell to update the question
    /// label with the correct text.
    ///
    /// - Parameters:
    ///   - cell: The cell that should be castable to a QuestionCell
    ///   - question: The Question object used to populate the question cell's label text
    private func populate(_ cell: UITableViewCell, with question: Question) {
        let questionCell = cell as? QuestionCell
        questionCell?.questionLabel.text = "- " + question.value
    }
    
    
    // MARK: - UITableViewDelegates
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let topic = topics[section]
        return TopicHeaderView(title: topic.title)
    }
}
