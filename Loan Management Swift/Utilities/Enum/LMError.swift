//
//  LMError.swift
//  Loan Management
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

enum LMError: String, Error{
    case technicalIssue = "We're experiencing technical difficulties. Please try again later."
    case unableToComplete = "Unable to complete your request, please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid"
}
