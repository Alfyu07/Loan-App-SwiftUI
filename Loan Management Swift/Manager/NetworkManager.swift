//
//  NetworkManager.swift
//  Loan Management
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://raw.githubusercontent.com/andreascandle/p2p_json_test/main/api/"
    
    private init() {}
    
    func getLoans(completed: @escaping(Result<[Loan], LMError>) -> Void){
        let endpoint = baseUrl + "/json/loans.json"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.technicalIssue))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let loanResponse = try decoder.decode([LoanResponse].self, from: data)
                let loans = loanResponse.map { item in
                    return Mapper.mapLoanResponseToModel(from: item)
                }
                completed(.success(loans))
            }catch{
                completed(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
}
