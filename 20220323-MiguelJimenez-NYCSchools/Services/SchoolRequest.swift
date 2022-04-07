//
//  SchoolService.swift
//  20220323-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 3/23/22.
//

import Foundation

enum SchoolError: Error {
    case notDataAvailable
    case canNotProccessData
}

final class SchoolRequest {
    
//    let resourceURL:URL
//
////    init() {
////
//        let resourceString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
//
//
//        guard let resourceURL = URL(string: resourceString) else {
//            fatalError()
//        }
//        self.resourceURL = resourceURL
//
//    }
    
    func fetchSchools(completionHandler: @escaping ([School]) -> Void) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching schools: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(String(describing: response))")
                      return
                  }
            
            if let data = data,
               let schoolData = try? JSONDecoder().decode([School].self, from: data) {
                completionHandler(schoolData)
            }
        })
        task.resume()
    }
    
    
    func fetchSchoolDetails( _ schoolCode: String,completionHandler: @escaping (SchoolDetail) -> Void) {
        
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(schoolCode)") else { return  }
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//            if let error = error {
//                print("Error with fetching schools: \(error)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                      print("Error with the response, unexpected status code: \(String(describing: response))")
//                      return
//                  }
//
//            if let data = data,
//               let schoolData = try? JSONDecoder().decode([SchoolDetail].self, from: data) {
//                guard let schoolDetail = schoolData.first else { return }
//                completionHandler(schoolDetail)
//            }
//        })
        
        let task  = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("We got an error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return 
            }

        }
        task.resume()
    }
    
}
