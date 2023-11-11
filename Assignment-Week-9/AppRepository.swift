//
//  AppRepository.swift
//  Assignment-Week-9
//
//  Created by Raiymbek Azharbayev on 11.11.2023.
//

import Foundation

struct AppRepository {
    
    static let shared = AppRepository()
    
    private init() {}
    
    var testList: [Task] = [
        Task(title: "Clean the garage", startDate: "2023-03-21", endDate: "2023-04-17", status: .completed),
        Task(title: "Call grandma", startDate: "2023-04-21", endDate: "2023-05-17", daysLeft: 12),
        Task(title: "Pay bills", startDate: "2023-05-21", endDate: "2023-06-17", status: .expired),
        Task(title: "Go shopping", startDate: "2023-05-21", endDate: "2023-06-17", daysLeft: 8),
        Task(title: "Practice piano", startDate: "2023-05-21", endDate: "2023-06-17", status: .completed),
        Task(title: "Check the weather", startDate: "2023-05-21", endDate: "2023-06-17", status: .expired),
        Task(title: "Play video games", startDate: "2023-05-21", endDate: "2023-06-17", status: .expired),
        Task(title: "Pack for the trip", startDate: "2023-05-21", endDate: "2023-06-17", daysLeft: 4),
        Task(title: "Repair the bike", startDate: "2023-05-21", endDate: "2023-06-17", daysLeft: 17),
        Task(title: "Exercise", startDate: "2023-05-21", endDate: "2023-06-17", status: .expired),
        Task(title: "Finish the report", startDate: "2023-05-21", endDate: "2023-06-17", status: .completed),
        Task(title: "Car maintenance", startDate: "2023-05-21", endDate: "2023-06-17", status: .completed),
        Task(title: "Send emails", startDate: "2023-05-21", endDate: "2023-06-17", daysLeft: 10),
        Task(title: "Fix the light", startDate: "2023-05-21", endDate: "2023-06-17", daysLeft: 24),
        Task(title: "Add new contacts", startDate: "2023-05-21", endDate: "2023-06-17", daysLeft: 23),
        Task(title: "Plan the week", startDate: "2023-05-21", endDate: "2023-06-17", status: .expired)
    ]
}
