//
//  ViewController.swift
//  AutoResizeTableView
//
//  Created by Abhishek Shukla on 18/05/19.
//  Copyright © 2019 Abhishek Shukla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let directors = Director.auteursFromBundle()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold) ]
         navigationItem.largeTitleDisplayMode = .automatic
        //When you set the row height as UITableViewAutomaticDimension, the table view is told to use the Auto Layout constraints and the contents of its cells to determine each cell’s height.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        //In order for the table view to do this, you must also provide an estimatedRowHeight. In this case, 600 is just an arbitrary value that works well in this particular instance. For your own projects, you should pick a value that better conforms to the type of data that you’ll display.
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DirectorDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedDirector = directors[indexPath.row]
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DirectorsTableViewCell
        let auteur = directors[indexPath.row]
        print(auteur)
        cell.directorsImageView.image = UIImage(named: auteur.image)
        cell.nameLabel.text = auteur.name
        cell.sourceLabel.text = auteur.source
        cell.bioLabel?.text = auteur.bio
        cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        cell.nameLabel.textColor = .white
        cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        cell.sourceLabel.textColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.0)
        cell.sourceLabel.font = UIFont.italicSystemFont(ofSize: cell.sourceLabel.font.pointSize)
        cell.nameLabel.textAlignment = .center
        cell.selectionStyle = .none
        cell.directorsImageView.layer.cornerRadius = cell.directorsImageView.frame.size.width / 2

        return cell
    }
}
