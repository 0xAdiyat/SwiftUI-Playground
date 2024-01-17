//
//  BarcodeScannerViewModel.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var statusTextColor: Color{
        scannedCode.isEmpty ? .red : .green
    }
}
