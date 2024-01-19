//
//  BarcodeScannerView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI



struct BarcodeScannerView: View {

    /// Usual way
//    @State private var isShowingAlert = false

    /// Second way
//    @State private var scannedCode = ""
//    @State private var alertItem: AlertItem?
    
    /// Third way
    @StateObject var viewModel = BarcodeScannerViewModel()

    
    var body: some View {

        NavigationStack{
            VStack{
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxHeight: 300)
                Spacer().frame(height: 60)
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title2)
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
                
//                Button{
//                    isShowingAlert = true
//                }label:{
//                    Text("Tap Me")
//                }
            }
            .navigationTitle("Barcode Scanner")
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text("Test"), message: Text("This is a test"),dismissButton: .default(Text("Ok")))
//            }
            .alert(item: $viewModel.alertItem) { item in
                Alert(title: item.titleText, message: item.messageText, dismissButton: item.dismissButton)
                
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
