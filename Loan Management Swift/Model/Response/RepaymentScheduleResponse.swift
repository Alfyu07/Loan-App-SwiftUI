//
//  RepaymentSchedule.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct RepaymentScheduleResponse: Codable{
    var installments: [InstallmentResponse]?
    
}

struct InstallmentResponse: Codable, Hashable{
    var dueDate: String
    var amountDue: Int
}
