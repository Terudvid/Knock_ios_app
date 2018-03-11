//
//  GitHubApi.swift
//  GitHubSearch
//
//  Created by 友金輝幸 on 2017/10/30.
//  Copyright © 2017年 Elicit. All rights reserved.
//

import Foundation

class GitHubApi {
        
    func getGitHubInfo(url urlString: String, queryItems: [URLQueryItem]? = nil) {
        
        var compnents = URLComponents(string: urlString)
        compnents?.queryItems = queryItems
        
        let url = compnents?.url
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data, let response = response {
                print(response)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print("Serialize Error")
                }
            } else {
                print(error ?? "Error")
            }
        }
        
        task.resume()
        
    }
    
}
