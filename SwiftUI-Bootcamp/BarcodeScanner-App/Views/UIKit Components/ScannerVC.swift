//
//  ScannerVC.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI
import AVFoundation

/// UIViewController --> Coordinator --> SwiftUIView

enum CameraError{
    case invalidDeviceInput
    case invalidScannedValue
}

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
    
}

final class ScannerVC: UIViewController{
    let captureSession = AVCaptureSession()
    var previewLayer = AVCaptureVideoPreviewLayer()
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession(){
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video)else{
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        var videoInput: AVCaptureDeviceInput
        
        do{
            try videoInput =  AVCaptureDeviceInput(device: videoCaptureDevice)
        }catch {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        }else{
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput){
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13]
            
        }else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)

            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
}


extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else{
            scannerDelegate?.didSurface(error: .invalidScannedValue)

            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        //        captureSession.stopRunning() /// in case if you want to stop
        scannerDelegate?.didFind(barcode: barcode)
    }
}

///In SwiftUI, `AVCaptureVideoPreviewLayer?.self` and `AVCaptureVideoPreviewLayer()` are different in terms of their usage and purpose.
///
///1. **`AVCaptureVideoPreviewLayer?.self`**:
///
///   - `AVCaptureVideoPreviewLayer?.self` refers to the metatype of the optional type `AVCaptureVideoPreviewLayer?`.
///   - It is commonly used when you need to refer to the type itself rather than creating an instance. For example, you might use it when working with generics or passing types as parameters.
///
///   Example:
///
///   ```swift
///   func someFunction<T>(type: T.Type) {
///       if type == AVCaptureVideoPreviewLayer?.self {
///           // Do something specific for AVCaptureVideoPreviewLayer? type
///       }
///   }
///
///   someFunction(type: AVCaptureVideoPreviewLayer?.self)
///   ```
///
///2. **`AVCaptureVideoPreviewLayer()`**:
///
///   - `AVCaptureVideoPreviewLayer()` creates an instance of the `AVCaptureVideoPreviewLayer` class.
///   - It is used when you want to create a new instance of the `AVCaptureVideoPreviewLayer` to use in your SwiftUI views or other parts of your code.
///
///   Example:
///
///   ```swift
///   let previewLayer = AVCaptureVideoPreviewLayer()
///   // Use previewLayer in your SwiftUI views or other parts of the code
///   ```
///
///In summary, `AVCaptureVideoPreviewLayer?.self` is used to refer to the type itself, while `AVCaptureVideoPreviewLayer()` is used to create an instance of the `AVCaptureVideoPreviewLayer` class. The choice between them depends on whether you need the type or an instance of the type in your specific scenario.
