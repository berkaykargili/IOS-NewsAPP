//
//  WebService.swift
//  NewsProject
//
//  Created by Berkay Kargılı on 19.11.2023.
//

import Foundation

class WebService {
    
    func newsDownload(url: URL,completion: @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let NewsSeries = try? JSONDecoder().decode([News].self, from: data)
                if let NewsSeries = NewsSeries {
                    completion(NewsSeries)
                }
            }
        }.resume()
        
    }
}
