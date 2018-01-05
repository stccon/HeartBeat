//
//  MyController.swift
//  HeatBeatExample
//
//  Created by app on 2018/1/5.
//  Copyright © 2018年 hyc. All rights reserved.
//

import UIKit

class MyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //开启心跳，调用一次即可
        Heartbeat.sharedInstance.run()
        
        //时间间隔为3，运行2次。
        Heartbeat.sharedInstance.listen(name: "beat", inteval: 3, times: 2) { (point) in
            print("计时器beat的心跳" + String(point))
        }
        
        //时间间隔为3，运行无数次。
        Heartbeat.sharedInstance.listen(name: "apple", inteval: 3, times: 0) { (point) in
            print("计时器apple的心跳" + String(point))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    deinit {
//        //"beat"是有限次的计时器，即使这里不手动释放，等计时器运行结束后也会自动释放的
//        Heartbeat.sharedInstance.delisten("beat")
//        Heartbeat.sharedInstance.delisten("apple")
//    }
    
}
