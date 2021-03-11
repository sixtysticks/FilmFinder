//
//  FilmTableViewController.swift
//  FilmFinder
//
//  Created by David Gibbs on 11/03/2021.
//

import UIKit

class FilmTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FilmTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

