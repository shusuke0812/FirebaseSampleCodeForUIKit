//
//  PostViewController.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/9/17.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import CropViewController
import Firebase

class PostViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    // MARK: - Action Method
    @IBAction func tapImageView(_ sender: Any) {
        print("DEBUG： 写真がタップされました")
        self.openImagePicker()
    }
    @IBAction func saveImageViewButton(_ sender: Any) {
        self.postImageToFirestore()
    }
}

// MARK: - Private Method
extension PostViewController {
    func setUI() {
        // imageViewを円にする
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
    }
}

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage: UIImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) else { return }
        let cropVC: CropViewController = CropViewController(croppingStyle: .circular, image: originalImage)
        cropVC.delegate = self
        picker.dismiss(animated: true, completion: {
            self.present(cropVC, animated: true, completion: nil)
        })
    }
    func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.imageView.image = image
        cropViewController.dismiss(animated: true, completion: nil)
    }
}

extension PostViewController {
     // Firebase Storageへデータを保存する
    func postImageToFirestore() {
        guard let image = self.imageView?.image else { return }
        guard let uploadImage = image.jpegData(compressionQuality: 0.3) else { return }
        
        let fileName = NSUUID().uuidString
        let filePath: String = "users/icon_image/"
        let storageRef = Storage.storage().reference().child(filePath).child(fileName)
        
        storageRef.putData(uploadImage, metadata: nil) { (metadata, err) in
            if let err = err {
                print("DEBUG： FireStorageへの情報保存に失敗しました")
                print(err)
            }
        }
    }
}
