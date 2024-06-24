//
//  Collateral.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct Collateral: Codable, Hashable{
    var id: UUID
    var type: String
    var value: Int
}
