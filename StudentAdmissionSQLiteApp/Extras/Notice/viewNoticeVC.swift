//
//  viewNoticeVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class viewNoticeVC: UIViewController {
    
    var notice: Notice?
    
    private let bgimage: UIImageView = {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "bg2.jpg")
        return bgimage
    }()
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        textField.isUserInteractionEnabled = false
        return textField
    }()
    private let noticeTextField:UITextView = {
        let textField = UITextView()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.textColor = .black
        textField.isEditable = false
        
        textField.layer.cornerRadius = 20
        return textField
    }()
    

    
    override func viewDidLoad() {
        
        
        self.view.backgroundColor = .white
        super.viewDidLoad()
        
        view.addSubview(bgimage)
        view.addSubview(nameTextField)
        view.addSubview(noticeTextField)
        
        if let note = notice {
            
            nameTextField.text = note.name
            noticeTextField.text = note.notice
        }
//
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "notebg.jpg")
//        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 600)
        nameTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 40, width: view.width - 80, height: 40)
        noticeTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 300)
        
    }

}

