//
//  PostViewController.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/9/17.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    @IBAction func changeImageViewButton(_ sender: Any) {
        // imagePickerを起動
        self.openImagePicker()
        guard let image = self.imageView?.image else { return }
        guard let uploadImage = image.jpegData(compressionQuality: 0.3) else { return }
        
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("user_image").child(fileName)
        
        storageRef.putData(uploadImage, metadata: nil) { (metadata, err) in
            if let err = err {
                print("DEBUG： FireStorageへの情報保存に失敗しました")
                print(err)
            }
        }
    }
}

extension PostViewController {
    func setUI() {
        // imageViewを円にする
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
    }
}
