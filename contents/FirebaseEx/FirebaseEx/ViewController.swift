//
//  ViewController.swift
//  FirebaseEx
//
//  Created by cskim on 2020/02/22.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    Firestore.firestore()
      .collection("Test")
      .addDocument(data: ["name": "cskim"]) { error in
        if let error = error {
          print(error.localizedDescription)
        } else {
          print("Success")
          Firestore.firestore()
          .collection("Test")
            .getDocuments { (snapshot, error) in
              if let error = error {
                print(error.localizedDescription)
              } else {
                guard let document = snapshot?.documents.first else { return }
                print(document.data())
              }
          }
        }
    }
  }

}

