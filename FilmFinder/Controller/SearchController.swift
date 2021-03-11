//
//  SearchController.swift
//  FilmFinder
//
//  Created by David Gibbs on 11/03/2021.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchField: UITextField!
    @IBOutlet var activitySpinner: UIActivityIndicatorView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Helpers
    
    func configureUI() {
        self.title = "Film Finder"
        descriptionLabel.text = "Search for a film"
        searchButton.setTitle("Search", for: .normal)
        activitySpinner.isHidden = true
    }
    
    // MARK: Actions
    
    @IBAction func tapSearchButton(_ sender: UIButton) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
        if let searchTerm = searchField?.text {
            if !searchTerm.isEmpty {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let tableVC = storyBoard.instantiateViewController(withIdentifier: "FilmTableViewController") as! FilmTableViewController
                
                self.navigationController?.pushViewController(tableVC, animated: true)
            }
        }
        
    }
}
