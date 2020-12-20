//
//  ViewController.swift
//  ProjectQRReader
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var viewPreview: UIView!
    
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var lblString: UILabel!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    var isReading: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPreview.layer.cornerRadius = 5;
        btnStartStop.layer.cornerRadius = 5;
        captureSession = nil;
        lblString.text = "Barcode discription...";
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonHandlerStart(_ sender: Any) {
     
        if !isReading {
            if (self.startReading()) {
                btnStartStop.setTitle("Stop", for: .normal)
                lblString.text = "Scanning for QR Code..."
            }
        }
        else {
            stopReading()
            btnStartStop.setTitle("Start", for: .normal)
        }
        isReading = !isReading
    }
    
func startReading() -> Bool {
    let captureDevice = AVCaptureDevice.default(for: .video)
    do{
        let input = try  AVCaptureDeviceInput(device: captureDevice!)
        captureSession = AVCaptureSession()
        captureSession?.addInput(input)
        
        
    }catch let error as NSError{
        print(error)
        return false
    }
    
    videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
    videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
    videoPreviewLayer.frame = viewPreview.layer.bounds
    
    viewPreview.layer.addSublayer(videoPreviewLayer)
    
    
    let captureMetadataOutput = AVCaptureMetadataOutput()
    captureSession?.addOutput(captureMetadataOutput)
    captureMetadataOutput.metadataObjectTypes = captureMetadataOutput.availableMetadataObjectTypes
    captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
    captureSession?.startRunning()
    
    return true
    }
    
    func stopReading(){
        captureSession?.stopRunning()
        captureSession = nil
        videoPreviewLayer.removeFromSuperlayer()
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for data in metadataObjects{
            let metaData = data as! AVMetadataObject
            print(metadataObjects.description)
            let transfromed = videoPreviewLayer.transformedMetadataObject(for: metaData) as? AVMetadataMachineReadableCodeObject
            if let unwrapped = transfromed{
                print(unwrapped.stringValue)
                lblString.text = unwrapped.stringValue
                btnStartStop.setTitle("Start", for: .normal)
                //self.perform(#selector(stopReading), on: DispatchQueue.main, with: nil, waitUntilDone: false)
                self.stopReading()
                isReading = false
            }
        }
    }
    
}

