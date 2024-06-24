//
//  LoanListViewModel.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import Foundation

class LoanListViewModel: ObservableObject {
    let padding: CGFloat = 24
    let sortStrings = ["Semua", "Nama", "Jumlah", "Jangka Waktu", "Tujuan Pinjam", "Rating Resiko"]
    
    @Published var loans: [Loan] = []
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
    @Published var selectedSort = "Semua" 
    @Published var filteredLoans: [Loan] = []
    
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
                            self.filteredLoans = loans
                            self.isLoading = false
                        }
                    }
                case .failure(let error):
                    showAlertOnMainThread(error: error)
            }
        }
    }
    
    func showAlertOnMainThread(error: LMError){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.showAlert = true
            self.errorMessage = error.rawValue
        }
    }
    
    func dismissAlert(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.showAlert = false
            self.errorMessage = ""
        }
    }
    
    func filterLoans() {
        switch selectedSort {
            case "Nama":
                filteredLoans = loans.sorted { $0.borrower.name < $1.borrower.name }
            case "Jumlah":
                filteredLoans = loans.sorted { $0.amount < $1.amount }
            case "Jangka Waktu":
                filteredLoans = loans.sorted { $0.term < $1.term }
            case "Tujuan Pinjam":
                filteredLoans = loans.sorted { $0.purpose < $1.purpose }
            case "Rating Resiko":
                filteredLoans = loans.sorted { $0.riskRating < $1.riskRating }
            default:
                filteredLoans = loans
        }
    }
}

