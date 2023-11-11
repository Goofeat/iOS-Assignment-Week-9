//
//  File.swift
//  Assignment-Week-9
//
//  Created by Raiymbek Azharbayev on 04.11.2023.
//

import Foundation

struct Task {
    var title: String
    var startDate: String
    var endDate: String
    var status: Status = .inProgress
    var daysLeft: Int?
    
    enum Status {
        case completed, inProgress, expired
    }
}
