//
//  APICall.swift
//  TubeTiming
//
//  Created by David Jin Li on 16/04/2022.
//

import Foundation

struct Train: Codable, Identifiable {
    let id = UUID()
    var platformName: String
    var timeToStation: Int
    var destinationName: String
}

class Api {
    func getData(completion: @escaping ([Train]) -> ()) {
        guard let url = URL(string: "https://api.tfl.gov.uk/StopPoint/940GZZDLCLA/arrivals") else {return }
        URLSession.shared.dataTask(with: url) {(data,_,_) in
            let trains = try! JSONDecoder().decode([Train].self, from: data!)
            DispatchQueue.main.async {
                completion(trains)
            }
        }
        .resume()
        
    }
}
