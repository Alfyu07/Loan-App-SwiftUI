//
//  LoanListViewModel.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import Foundation

class LoanListViewModel: ObservableObject {
    let padding: CGFloat = 24
    @Published var loans: [Loan] = []
    @Published var isLoading: Bool = false
    
    func getLoans(){
        isLoading = true
        NetworkManager.shared.getLoans {[weak self] result in
            guard let self = self else {return}
            switch(result){
                case .success(let loans):
                    if loans.isEmpty {
                        
                        DispatchQueue.main.async{
                            self.isLoading = false
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.loans = loans
                            self.isLoading = false
                        }
                        print(loans)
                    }
                case .failure(let error):
                    print(error.rawValue)
            }
        }
    }
    
}
