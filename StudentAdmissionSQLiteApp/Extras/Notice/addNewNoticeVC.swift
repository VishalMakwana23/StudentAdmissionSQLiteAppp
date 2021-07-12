//
//  addNewNoticeVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class addNewNoticeVC: UIViewController {
    
    
    var notice: Notice?
  
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
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

//        textField.attributedPlaceholder = NSAttributedString(string: "Class", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        return textField
    }()
   
    private let insert:UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(saveStudData), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        
        
        self.view.backgroundColor = .white
        super.viewDidLoad()

        view.addSubview(nameTextField)
        view.addSubview(noticeTextField)
        view.addSubview(insert)
        
        if let note = notice {
            
            nameTextField.text = note.name
            noticeTextField.text = note.notice
        }
        
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "notebg.jpg")
//        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 40, width: view.width - 80, height: 40)
        noticeTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 300)
        insert.frame = CGRect(x: 40, y: noticeTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func saveStudData(){
        
       
        let name = nameTextField.text!
        let notes = noticeTextField.text!

        if let note = notice {
            
            let updatenote = Notice (id: note.id, name: name, notice: notes)
            
            update(note: updatenote)
        } else {
            
            let note = Notice(id: 0, name: name, notice: notes)
            
            insert(note: note)
        }
        
        
        
        
        
    }
    
    

    
    
    private func insert(note:Notice) {
        SQLiteNoticeHandler.shared.insert(note: note) { [weak self] success in
            
            if success {
                let alert = UIAlertController(title: "Success", message: "Data Saved Successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {[weak self] _ in
                    self?.navigationController?.popViewController(animated: true)
                }))
                DispatchQueue.main.async {
                    self?.present(alert, animated:  true, completion: nil)
                }
            } else {
                
                let alert = UIAlertController(title: "Oops!", message: "Issue in Saving Data. Please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "dismiss", style: .cancel))
                DispatchQueue.main.async {
                    self?.present(alert, animated:  true, completion: nil)
                }
            }
            
        }
    }
    
    private func update(note:Notice) {
        SQLiteNoticeHandler.shared.update(note: note) { [weak self] success in
            
            if success {
                let alert = UIAlertController(title: "Success", message: "Data Saved Successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {[weak self] _ in
                    self?.navigationController?.popViewController(animated: true)
                }))
                DispatchQueue.main.async {
                    self?.present(alert, animated:  true, completion: nil)
                }
            } else {
                
                let alert = UIAlertController(title: "Oops!", message: "Issue in Saving Data. Please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "dismiss", style: .cancel))
                DispatchQueue.main.async {
                    self?.present(alert, animated:  true, completion: nil)
                }
            }
            
        }
    }
}
