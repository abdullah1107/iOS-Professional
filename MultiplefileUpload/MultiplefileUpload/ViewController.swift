//
//  ViewController.swift
//  MultiplefileUpload
//
//  Created by Muhammad Abdullah Al Mamun on 26/11/20.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}

import UIKit
 
import BSImagePicker
import Photos
import Alamofire

struct HTTPBinResponse: Decodable { let url: String }
 
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
     
    private var collectionView: UICollectionView!
    private let identifier: String = "identifier"
    private var selectedImages: [String] = []
    
    
    let parameters = [
        
        "productname" : "m-image",
        "productpriceoriginal": "22",
        "sellproductprice":"333",
        "productcategoryID":"5",
        "vendorID":"2",
        "isrecentproduct":"is_new",

    
    ] as  [String:String]
    var ImageArray : NSMutableArray!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        let btnSelectImage: UIButton = UIButton(frame: CGRect(x: 30, y: 100, width: view.frame.size.width - 60, height: 30))
        btnSelectImage.setTitle("Select images", for: .normal)
        btnSelectImage.setTitleColor(UIColor.systemBlue, for: .normal)
        btnSelectImage.contentHorizontalAlignment = .center
        btnSelectImage.addTarget(self, action: #selector(selectImages), for: .touchUpInside)
        view.addSubview(btnSelectImage)
         
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.itemSize = CGSize(width: 300, height: 300)
 
        collectionView = UICollectionView(frame: CGRect(x: 0, y: btnSelectImage.frame.origin.y + btnSelectImage.frame.size.height + 30, width: view.frame.size.width, height: 300), collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: identifier)
        view.addSubview(collectionView)
         
        let btnUpload: UIButton = UIButton(frame: CGRect(x: 30, y: collectionView.frame.origin.y + collectionView.frame.size.height + 30, width: view.frame.size.width - 60, height: 40))
        btnUpload.setTitle("Upload to server", for: .normal)
        btnUpload.backgroundColor = UIColor.systemGreen
        btnUpload.setTitleColor(UIColor.white, for: .normal)
        btnUpload.addTarget(self, action: #selector(uploadToServer), for: .touchUpInside)
        btnUpload.layer.cornerRadius = 5
        view.addSubview(btnUpload)
    }
     
    @objc private func uploadToServer(sender: UITapGestureRecognizer) {
        
        
        let alert = UIAlertController(title: "Loading", message: "Please wait...", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
//        let ImageDic = [
//            "productcoverImage" : UIImage(named: "\(self.selectedImages[0])")!.pngData(),
//            "product_image[0]image" : UIImage(named: "\(self.selectedImages[1])")!.pngData(),
//            "product_image[1]image" : UIImage(named: "\(self.selectedImages[2])")!.pngData(),
//            //"product_image[2]image" : UIImage(named: "cc")!.pngData()
//        ]
        
let ImageDic = [
    "productcoverImage"     : UIImage(named:selectedImages[0])?.pngData(),
"product_image[\(0)]image"  : UIImage(named:selectedImages[1])?.pngData(),
"product_image[\(1)]image" :  UIImage(named: selectedImages[2])?.pngData()
]
                    //"product_image[2]image" : UIImage(named: "cc")!.pngData()
                
ImageArray = NSMutableArray(array: [ImageDic as NSDictionary])
        
//
//
//        Alamofire.upload(multipartFormData: { (MultipartFormData) in
//
//
//                for (imageDic) in imageArray
//                {
//                    let imageDic = imageDic as! NSDictionary
//
//                    for (key,valus) in imageDic
//                    {
//                        MultipartFormData.append(valus as! Data, withName:key as! String,fileName: "file.jpg", mimeType: "image/jpg")
//                    }
//                }
//
//
//                for (key, value) in postParam
//                {
//                    MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
//
//        }, to: "http://127.0.0.1:8000/products/", usingThreshold: UInt64.init(), method: .post).response { (response) in
//                print("response",response.debugDescription)
//            }

        
 
//        var imageStr: [String] = []
//        for a in 0..<self.selectedImages.count {
//            let imageData: Data = self.selectedImages[a].jpegData(compressionQuality: 0.1)!
//            imageStr.append(imageData.base64EncodedString())
//        }
//
//
//        guard let data = try? JSONSerialization.data(withJSONObject: imageStr, options: []) else {
//            return
//        }
//
//        let jsonImageString: String = String(data: data, encoding: String.Encoding.utf8) ?? ""
//        print("jsonImageString:",jsonImageString )
//        print("###############################################\n")
//        let urlString: String = jsonImageString
//
////        var urlString:[String] = []
////
////        for i in 0 ..< jsonImageString.count{
////            urlString.append("product_image\([i])image=", jsonImageString[i])
////        }
//
//        var request: URLRequest = URLRequest(url: URL(string: "http://127.0.0.1:8000/products/")!)
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.httpBody = urlString.data(using: .utf8)
//
//        NSURLConnection.sendAsynchronousRequest(request, queue: .main, completionHandler: { (request, data, error) in
//
//            guard let data = data else {
//                return
//            }
//
//            let responseString: String = String(data: data, encoding: .utf8)!
//            print("my_log = " + responseString)
//
//            alert.dismiss(animated: true, completion: {
//                let messageAlert = UIAlertController(title: "Success", message: responseString, preferredStyle: .alert)
//                messageAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
//                    //
//                }))
//                self.present(messageAlert, animated: true, completion: nil)
//            })
//        })
        
        let url = ""
        postImageRequestWithURL(withUrl: url, withParam: parameters, withImages: ImageArray) { (isSuccess, response) in
              
           // print("ss",isSuccess.description)
           // print("res",response)
            }
    }
    
    func postImageRequestWithURL(withUrl strURL: String,withParam postParam: Dictionary<String, Any>,withImages imageArray:NSMutableArray,completion:@escaping (_ isSuccess: Bool, _ response:NSDictionary) -> Void)
    {
        
       // print("hehehehheheheh",selectedImages[0])

        AF.upload(multipartFormData: { (MultipartFormData) in


            for (imageDic) in imageArray
            {
                let imageDic = imageDic as! NSDictionary

                for (key,valus) in imageDic
                {
                    MultipartFormData.append((valus as! Data), withName:key as! String,fileName: "file.jpg", mimeType: "image/jpg")
                }
            }


            for (key, value) in postParam
            {
                MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }

        }, to: "http://59.153.101.52/products/api/v1/create/", usingThreshold: UInt64.init(), method: .post).response { (response) in
            //print("response",response.debugDescription)
        }

    }
     
    @objc private func selectImages(sender: UITapGestureRecognizer) {
        
        //self.selectedImages.removeAll()
   
        let imagePicker = ImagePickerController()
        presentImagePicker(imagePicker, select: { (asset) in
        }, deselect: { (asset) in
             
        }, cancel: { (assets) in
             
        }, finish: { (assets) in
            
            //self.selectedImages = []
            self.selectedImages.removeAll()
            let options: PHImageRequestOptions = PHImageRequestOptions()
            options.deliveryMode = .highQualityFormat
            
            for asset in assets {
                PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options) { (image, info) in
                    
                    if let fileName = asset.value(forKey: "filename") as? String{
                        
                        print(fileName)
                       
                       self.selectedImages.append(fileName)
                    }
                    
                   
                    
//                    if let asset = info?["UIImagePickerControllerPHAsset"] as? PHAsset{
//                        if let fileName = asset.value(forKey: "filename") as? String{
//                            print("FileName",fileName)
//                            self.selectedImages.append(fileName)
//                        }
//                    }
                   
                    
                    
                    self.collectionView.reloadData()
                }
            }
        })
    }
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let data: UIImage = selectedImages[indexPath.item]
        let cell: ImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCell
        //cell.image.image = data
        return cell
    }
 
 
}
 
class ImageCell: UICollectionViewCell {
    var image: UIImageView!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
     
    private func setupViews() {
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        addSubview(image)
    }
}

