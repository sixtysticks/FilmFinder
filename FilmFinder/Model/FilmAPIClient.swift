//
//  FilmAPIClient.swift
//  FilmFinder
//
//  Created by David Gibbs on 11/03/2021.
//

import Foundation
import Alamofire

class FilmAPIClient {
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> FilmAPIClient {
        struct Singleton {
            static var sharedInstance = FilmAPIClient()
        }
        return Singleton.sharedInstance
    }
    
    // MARK: Make network call to film API
    
    func callFilmAPI(searchTerm: String, completionHandler: @escaping (_ success: Bool, _ error: String?) -> Void) {
        
        AF.request("\(OMDConstants.SearchAPI)\(searchTerm)\(OMDConstants.ApiKeyParam)").validate().responseJSON { response in
            
            print("STARTED! \(OMDConstants.SearchAPI)\(searchTerm)\(OMDConstants.ApiKeyParam)")
            print(response)
            
            // Check if the user receives a response from API
            guard let responseJSON = response.value else {
                completionHandler(false, OMDConstants.NoResponse)
                return
            }
            
            print(responseJSON)
            completionHandler(true, nil)
            
        }
        
        
    }
    
}
