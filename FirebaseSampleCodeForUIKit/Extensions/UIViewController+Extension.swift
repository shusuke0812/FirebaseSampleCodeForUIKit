//
//  UIViewController+Extension.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/9/17.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

extension UIViewController {
    /// imagePickerを起動する
    internal func openImagePicker() {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.sourceType = .photoLibrary
        picker.navigationBar.barTintColor = .black
        self.present(picker, animated: true, completion: nil)
    }
}
