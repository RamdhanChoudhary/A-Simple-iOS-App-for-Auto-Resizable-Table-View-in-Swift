//
//  DirectorDetailViewController.swift
//  AutoResizeTableView
//
//  Created by Abhishek Shukla on 18/05/19.
//  Copyright © 2019 Abhishek Shukla. All rights reserved.
//

import UIKit

class DirectorDetailViewController: UIViewController {
    var selectedDirector: Director!
    let moreInfoText = "Tap For Details >"
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedDirector.name
        self.tableView.contentInsetAdjustmentBehavior = .never
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
}

extension DirectorDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedDirector.films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilmTableViewCell
        let film = selectedDirector.films[indexPath.row]
        cell.filmTitleLabel.text = film.title
        cell.filmImageView.image = UIImage(named: film.poster)
        cell.filmTitleLabel.textColor = .white
        cell.filmTitleLabel.textAlignment = .center
        cell.moreInfoTextView.textColor = .red
        cell.moreInfoTextView.text = film.isExpanded ? film.plot : moreInfoText
        cell.moreInfoTextView.textAlignment = film.isExpanded ? .left : .center
        cell.moreInfoTextView.textColor = film.isExpanded ?
            UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) :
            .red
        cell.selectionStyle = .none
        
        return cell
    }
}
extension DirectorDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1
        guard let cell = tableView.cellForRow(at: indexPath) as? FilmTableViewCell else {
            return
        }
        
        var film = selectedDirector.films[indexPath.row]
        
        // 2
        film.isExpanded = !film.isExpanded
        selectedDirector.films[indexPath.row] = film
        
        // 3
        cell.moreInfoTextView.text = film.isExpanded ? film.plot : moreInfoText
        cell.moreInfoTextView.textAlignment = film.isExpanded ? .left : .center
        cell.moreInfoTextView.textColor = film.isExpanded ?
            UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) :
            .red
        
        // 4
        tableView.beginUpdates()
        tableView.endUpdates()
        
        // 5
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
