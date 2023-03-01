//
//  ContentView.swift
//  Project1
//
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var demoData: [Double] = [340, 415, 615, 615, 615 ,790]
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty{
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading){
    //                          ChartLabel("$900", type: .title)
                                ChartLabel("$900", type: .title, format:"$%.02f")
                                
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(demoData)
                        //   .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                        
                    }
                   
                    
                    
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //MARK: Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static let transactionListVM: TransactionListViewModel  = {
            let transactionListVM = TransactionListViewModel()
            transactionListVM.transactions = transactionListPreviewData
            return transactionListVM
        }()
        static var previews: some View {
            Group{
                ContentView()
                ContentView()
                    .preferredColorScheme(.dark)
                
            }
            .environmentObject(transactionListVM)
        }
    }
}
