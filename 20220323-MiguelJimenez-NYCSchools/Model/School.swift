//
//  School.swift
//  20220323-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 3/23/22.
//

import Foundation

struct School: Codable {
    
    var dbn:String?
    var schoolName:String?
    var city:String?
    
    enum CodingKeys:String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case city = "city"
    }
    
    init(dbn: String?, schoolName: String?) {
        self.dbn = dbn
        self.schoolName = schoolName
    }
}
