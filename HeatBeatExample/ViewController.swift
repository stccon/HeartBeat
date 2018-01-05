//
//  ViewController.swift
//  HeatBeatExample
//
//  Created by app on 2018/1/5.
//  Copyright © 2018年 hyc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func click(_ sender: Any) {
        
        let story: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: UIViewController = story.instantiateViewController(withIdentifier: "MyController")
        self.present(vc, animated: true, completion: nil)
    }
    
    

}

