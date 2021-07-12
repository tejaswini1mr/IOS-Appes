//
//  DataUrl.swift
//  Fancided
//
//  Created by Tejaswini MR on 29/03/21.
//

import Foundation

struct DataUrl{
    let url = "https://fansided.com/feed/"

    func performRequest(completionHandler: @escaping (Data) -> Void) -> () {
        let request = URLRequest(url: Foundation.URL(string: url)!)
                let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in

                    guard error == nil && data != nil else
                    {
                        print("error=\(String(describing: error))")
                        return
                    }

                    completionHandler(data!)
                })
                task.resume()
    }
    

}
