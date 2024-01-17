//
//  ScannerView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI


/// UIViewController --> Coordinator --> SwiftUIView


struct ScannerView: UIViewControllerRepresentable {
 
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
     Coordinator(scannerView: self)
    }
    
    
    final class Coordinator: NSObject, ScannerVCDelegate{
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            
        }
        
        func didSurface(error: CameraError) {
            switch error{
                case .invalidDeviceInput:
                    scannerView.alertItem  = AlertContext.invalidDeviceInput
                case .invalidScannedValue:
                    scannerView.alertItem  = AlertContext.invalidScannedType
            }
            
        }
        
        
    }
}

//#Preview {
//    ScannerView(scannedCode: .constant("23232"))
//}
