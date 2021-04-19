//
//  ViewController.swift
//  SceneAndViewControllerLifeCycle
//
//  Created by Chaithra Pabbathi on 3/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(#function)")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("\(#function)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        print("\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        print("\(#function)")
    }
}

