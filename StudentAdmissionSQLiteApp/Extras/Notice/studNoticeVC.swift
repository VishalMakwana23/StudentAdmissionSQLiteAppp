//
//  studNoticeVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class studNoticeVC: UIViewController {

    
    
    private var noteArray = [Notice]()
    private let StudTableView = UITableView()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        noteArray = SQLiteNoticeHandler.shared.fetch()
        StudTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notice Board"
        self.view.backgroundColor = .white
//        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewStudent))
        view.addSubview(StudTableView)
//        navigationItem.setRightBarButton(addItem, animated: true)
        setupTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        StudTableView.frame = view.bounds
    }
//    @objc private func addNewStudent() {
//
//        let vc = addNewNoticeVC()
//        navigationController?.pushViewController(vc, animated: true)
//
//    }
    
    
}


extension studNoticeVC: UITableViewDataSource,UITableViewDelegate {
    
    private func setupTableView() {
        
        StudTableView.register(UITableViewCell.self, forCellReuseIdentifier: "note")
        StudTableView.delegate = self
        StudTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        
        let note = noteArray[indexPath.row]
        cell.textLabel?.text = "\(note.name) \t | \(note.notice)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc  = viewNoticeVC()
        vc.notice = noteArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        let id = noteArray[indexPath.row].id
//        
//        SQLiteHandler.shared.delete(for: id)  {[weak self ] success in
//            if success {
//                self?.noteArray.remove(at:indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            } else {
//                let alert = UIAlertController(title: "Oops!", message: "Failed to delete data. Please try again", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel))
//                DispatchQueue.main.async {
//                    self?.present(alert, animated: true, completion: nil)
//                }
//            }
//        }
//    }
}
