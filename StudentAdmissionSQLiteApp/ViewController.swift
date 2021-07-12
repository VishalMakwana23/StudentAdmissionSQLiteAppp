//
//  ViewController.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 06/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//
//    let adminToken = UserDefaults.standard.string(forKey: "sesionAdmin")
//    let adminName = UserDefaults.standard.string(forKey: "admin")
//
//
//    let studentToken = UserDefaults.standard.string(forKey: "sesionStudent")
//    let studentName = UserDefaults.standard.string(forKey: "student")
//
//    private let username_lbl : UILabel = {
//        let welcome = UILabel()
//        welcome.text = "Username:"
//        welcome.textColor = .white
//        welcome.textAlignment = .center
//        welcome.shadowColor = .darkGray
//        return welcome
//    }()
//
//
//    //    private let login_btn:UIButton = {
//    //        let button = UIButton()
//    //        button.setTitle("Login", for: .normal)
//    //        button.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
//    //        button.backgroundColor = .gray
//    //        button.layer.cornerRadius = 25
//    //        button.setTitleColor(.white, for: .normal)
//    //        return button
//    //    }()
//
//    private let logout_btn:UIButton = {
//        let button = UIButton()
//        button.setTitle("Logout", for: .normal)
//        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
//        button.backgroundColor = .gray
//        button.layer.cornerRadius = 25
//        button.setTitleColor(.white, for: .normal)
//        return button
//    }()
//
//    @objc private func logoutTapped(){
//
//        UserDefaults.standard.setValue(nil, forKey: "sesionToken")
//        UserDefaults.standard.setValue(nil, forKey: "username")
//        print("session clear")
//        let lv = LoginVC()
//        let nav = UINavigationController(rootViewController: lv)
//        nav.modalPresentationStyle = .fullScreen
//        nav.setNavigationBarHidden(true, animated: false)
//        present(nav,animated: false)
//
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("run")
//        //view.addSubview(logo_img)
//       // view.addSubview(username_lbl)
//        //        view.addSubview(login_btn)
//        //view.addSubview(logout_btn)
//
//
//        //        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        //        backgroundImage.image = UIImage(named: "bg4.jpg")
//        //        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
//        //        self.view.insertSubview(backgroundImage, at: 0)
//    }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        checkUserAuth()
//    }
//
//    private func checkUserAuth(){
//
//        if let adminToken  = UserDefaults.standard.string(forKey: "sesionAdmin"),
//            let adminName = UserDefaults.standard.string(forKey: "admin"){
//            print(" token :  \(adminToken)")
//           username_lbl.text = "Welcome, \(adminName)"
//            print("admin session set")
//            let ad = AdminVC()
//            let nav = UINavigationController(rootViewController: ad)
//           // nav.modalPresentationStyle = .fullScreen
//           // nav.setNavigationBarHidden(true, animated: false)
//            present(nav,animated: false)
//        } else if let studentToken  = UserDefaults.standard.string(forKey: "sesionStudent"),
//            let studentName = UserDefaults.standard.string(forKey: "student"){
//                print(" token :  \(studentToken)")
//                username_lbl.text = "Welcome, \(studentName)"
//                print("student session")
//                let st = StudentVC()
//                let nav = UINavigationController(rootViewController: st)
//                //nav.modalPresentationStyle = .fullScreen
//                //nav.setNavigationBarHidden(true, animated: false)
//                present(nav,animated: false)
//
//        } else {
//
//            let lv = LoginVC()
//            let nav = UINavigationController(rootViewController: lv)
//            nav.modalPresentationStyle = .fullScreen
//            nav.setNavigationBarHidden(true, animated: false)
//            present(nav,animated: false)
//        }
//
//
//
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        username_lbl.frame = CGRect(x: 20, y: 240, width: (view.width-40), height: 40)
//        //        login_btn.frame = CGRect(x: 20, y: username_lbl.bottom + 20, width: (view.width-40), height: 40)
//        logout_btn.frame = CGRect(x: 20, y: username_lbl.bottom + 20, width: (view.width-40), height: 40)
//
//    }
//
//
//
//
//}
//




    private var studArray = [Students]()
    
//
//    private let bgimage: UIImageView = {
//        let bgimage = UIImageView()
//        bgimage.image = UIImage(named: "bg2.jpg")
//        return bgimage
//    }()
//
//    private let label :UILabel = {
//        let label = UILabel()
//        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
//        label.font = .boldSystemFont(ofSize: 22)
//        label.text = "VNSGU"
//        label.textAlignment = .center
//        label.font = font
//        label.textColor = .black
//        return label
//    }()
//
//    private let username : UITextField = {
//
//        let textView = UITextField()
//        textView.placeholder = "Enter Username"
//        textView.textAlignment = .center
//        textView.backgroundColor = .white
//        textView.autocapitalizationType = .none
//        textView.layer.cornerRadius = 70
//        return textView
//    }()
//
//    private let password : UITextField = {
//
//        let textView = UITextField()
//        textView.placeholder = "Enter Password"
//        textView.textAlignment = .center
//        textView.backgroundColor = .white
//        textView.autocapitalizationType = .none
//        textView.layer.cornerRadius = 70
//        return textView
//    }()
//
//    private let vcbutton : UIButton = {
//        let vc_button = UIButton()
//        vc_button.setTitle("Login", for: .normal)
//        vc_button.backgroundColor = .black
//        vc_button.addTarget(self, action: #selector(redirect), for: .touchUpInside)
//        vc_button.layer.cornerRadius = 50
//        return vc_button
//    } ()

    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "admission")
        return imageView
    }()
    
    
    
    
    private let username: UITextField = {
        let usr = UITextField()
        
        usr.textAlignment = .center
        usr.autocapitalizationType = .none
        usr.autocorrectionType = .no
        usr.font = UIFont(name: "", size: 20.0)
        usr.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        usr.attributedPlaceholder = NSAttributedString(string: "USERNAME", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        usr.layer.cornerRadius = 20
        
        return usr
        
    } ()
    
    
    
    
    private let password: UITextField = {
        let psw = UITextField()
        //        psw.borderStyle = .roundedRect
        //text.backgroundColor = .systemFill
        psw.textAlignment = .center
        //        psw.textColor = .black
        //psw.placeholder = "Enter Password"
        psw.autocorrectionType = .no
        psw.font = UIFont(name: "", size: 20.0)
        psw.isSecureTextEntry = true
        psw.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        psw.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        psw.layer.cornerRadius = 20
        return psw
        
        
        
    } ()
    
    
    
    private let login : UIButton = {
        let con = UIButton()
        
        con.setTitle("Login", for: .normal)
        con.addTarget(self, action: #selector(logginTapped), for: .touchUpInside)
        // con.backgroundColor = .gray
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        con.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return con
        
        
    } ()
    
    @objc func logginTapped()
    {
        let stdcnt = studArray.count
        
        if(username.text == "admin" && password.text == "admin")
        {
            let vc = AdminVC()
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            for i in 0..<stdcnt
            {
                if (username.text! == studArray[i].spid) && (password.text! == studArray[i].password)
                {
                    let vc = StudentVC()
                    
                    UserDefaults.standard.setValue(username.text, forKey: "spid")
                    UserDefaults.standard.setValue(studArray[i].name, forKey: "name")
                    UserDefaults.standard.setValue(studArray[i].clas, forKey: "clas")
                    UserDefaults.standard.setValue(studArray[i].div, forKey: "div")
                    UserDefaults.standard.setValue(studArray[i].sem, forKey: "sem")
                    UserDefaults.standard.setValue(studArray[i].mobileno, forKey: "mobileno")
                    navigationController?.pushViewController(vc, animated: true)
                    break
                }
                else
                {
                    let alert = UIAlertController(title: "Please Enter Correct Credentials", message: "Incorrect Username Or Password", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Close", style: .cancel))
                    DispatchQueue.main.async {
                        self.present(alert, animated: true) {
                            self.username.text = ""
                            self.password.text = ""
                            
                        }
                    }
                }
            }
          
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(login)
        
        studArray = SQLiteHandler.shared.fetch()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "login.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 600)
//        label.frame = CGRect(x: 20, y: 180, width: view.width - 40, height: 40)
//        username.frame = CGRect(x: 20, y: label.bottom + 20, width: view.width - 40, height: 40)
//        password.frame = CGRect(x: 20, y: username.bottom + 20, width: view.width - 40, height: 40)
//        vcbutton.frame = CGRect(x: 20, y: password.bottom + 20, width: view.width - 40, height: 40)
        
        
        myImageView.frame = CGRect(x: 160, y:view.safeAreaInsets.top + 30, width: 50, height: 50)
        username.frame = CGRect(x: 30, y: myImageView.bottom + 220 , width: view.width - 60, height: 40)
        password.frame = CGRect(x: 30, y: username.bottom + 5, width: view.width - 60, height: 40)
        login.frame = CGRect(x: 30, y: password.bottom + 20, width: view.width - 60, height: 40)
        
}
}
