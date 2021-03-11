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
    
    func showActivitySpinner(_ spinning: Bool) {
        if spinning {
            DispatchQueue.main.async {
                self.activitySpinner.isHidden = true
                self.activitySpinner.stopAnimating()
            }
        } else {
            DispatchQueue.main.async {
                self.activitySpinner.isHidden = false
                self.activitySpinner.startAnimating()
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func tapSearchButton(_ sender: UIButton) {
        showActivitySpinner(true)
        
        
        if let searchTerm = searchField?.text {
            if !searchTerm.isEmpty {
                                
                FilmAPIClient.sharedInstance().callFilmAPI(searchTerm: searchTerm.replacingOccurrences(of: " ", with: "+")) { (result, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.showActivitySpinner(false)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.showActivitySpinner(false)
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let tableVC = storyBoard.instantiateViewController(withIdentifier: "FilmTableViewController") as! FilmTableViewController
                            self.navigationController?.pushViewController(tableVC, animated: true)
                        }
                    }
                }
            }
        }
    }
}
