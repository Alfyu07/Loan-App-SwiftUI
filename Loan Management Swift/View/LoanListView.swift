//
//  ContentView.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import SwiftUI

struct LoanListView: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = LoanListViewModel()
    var sortStrings = ["Semua", "Nama", "Jumlah", "Jangka Waktu"]
    @State  var selectedSort = "Semua"
    
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading, spacing: 0){
                title
                loanlist
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
        .padding()
        .onAppear{
            vm.getLoans()
        }
        .alert(vm.errorMessage, isPresented: $vm.showAlert) {
            Button("OK", role: .cancel) {
                vm.dismissAlert()
            }
        }
    }
}

extension LoanListView {
    
    var title : some View {
        HStack{
            Text("List Peminjam")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Menu {
                ForEach(vm.sortStrings, id: \.self) {sortBy in
                    Button{
                        vm.selectedSort = sortBy
                        vm.filterLoans()
                    }label: {
                        HStack{
                            Text(sortBy)
                            if vm.selectedSort == sortBy {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                    .foregroundColor(.black)
                        
                }
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.blue)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        
    }
    
    var loanlist: some View {
        VStack{
            if vm.isLoading {
                VStack{
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2.0)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            }else if vm.filteredLoans.isEmpty{
                ContentUnavailableView(LMError.noData.rawValue, systemImage: "doc.richtext.fill")
            }else {
                ForEach(vm.filteredLoans, id: \.id){ loan in
                    LMLoanCard(loan: loan)
                        .padding(.top, loan != vm.loans.first ? 10 : 0)
                        .onTapGesture {
                            router.push(.detailView(loan: loan))
                        }
                }
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top)
        .ignoresSafeArea()
        
    }
}
