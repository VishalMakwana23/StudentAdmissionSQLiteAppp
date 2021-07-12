//
//  addStudVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class addStudVC: UIViewController {
    
    var students: Students?
    private let rollnoTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "SPID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        return textField
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
        return textField
    }()
    private let clasTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Class", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        return textField
    }()
    private let divTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Division", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        return textField
    }()
    private let semTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Semester", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        return textField
    }()
    private let mobilenoTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Mobile", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        textField.layer.cornerRadius = 20
        return textField
    }()
    private let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "", size: 20.0)
        textField.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
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
        
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "bg.jpg")
//        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
       self.view.backgroundColor = .white
       // view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        super.viewDidLoad()
        view.addSubview(rollnoTextField)
        view.addSubview(nameTextField)
        view.addSubview(clasTextField)
        view.addSubview(divTextField)
        view.addSubview(semTextField)
        view.addSubview(mobilenoTextField)
        view.addSubview(passwordTextField)
        view.addSubview(insert)
        
        if let stud = students {
            rollnoTextField.text = stud.spid
            nameTextField.text = stud.name
            clasTextField.text = stud.clas
            divTextField.text = stud.div
            semTextField.text = String(stud.sem)
            mobilenoTextField.text = stud.mobileno
            passwordTextField.text = stud.password
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rollnoTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        nameTextField.frame = CGRect(x: 40, y: rollnoTextField.bottom + 20, width: view.width - 80, height: 40)
        clasTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
        divTextField.frame = CGRect(x: 40, y: clasTextField.bottom + 20, width: view.width - 80, height: 40)
        semTextField.frame = CGRect(x: 40, y: divTextField.bottom + 20, width: view.width - 80, height: 40)
        mobilenoTextField.frame = CGRect(x: 40, y: semTextField.bottom + 20, width: view.width - 80, height: 40)
        passwordTextField.frame = CGRect(x: 40, y: mobilenoTextField.bottom + 20, width: view.width - 80, height: 40)
        insert.frame = CGRect(x: 40, y: passwordTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func saveStudData(){
        
        let spid = rollnoTextField.text!
        let name = nameTextField.text!
        let clas = clasTextField.text!
        let div = divTextField.text!
        let sem = Int(semTextField.text!)!
        let mobileno = mobilenoTextField.text!
        let password = passwordTextField.text!
        
        if let stud = students  {
            
            let updateStud = Students(id: stud.id, spid: spid, name: name, clas: clas, div: div, sem: sem, mobileno: mobileno, password: password)
            
            update(stud: updateStud)
        } else {
            
            let stud = Students(id: 0, spid: spid, name: name, clas: clas, div: div, sem: sem, mobileno: mobileno, password: password)
            
            insert(stud: stud)
        }
        
       
        
       
        
    }
    
    
    private func insert(stud:Students) {
        SQLiteHandler.shared.insert(stud: stud) { [weak self] success in
            
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
    
    private func update(stud:Students) {
        SQLiteHandler.shared.update(stud: stud) { [weak self] success in
            
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
