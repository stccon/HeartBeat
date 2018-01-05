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
        //开启心跳，调用一次即可
        Heartbeat.sharedInstance.run()
        
        //时间间隔为3，运行2次。
        Heartbeat.sharedInstance.listen(name: "beat", inteval: 3, times: 2) { (point) in
            print("计时器beat的心跳")
        }
        
        //时间间隔为3，运行无数次。
        Heartbeat.sharedInstance.listen(name: "apple", inteval: 3, times: 0) { (point) in
            print("计时器apple的心跳")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    deinit {
        //"beat"是有限次的计时器，即使这里不手动释放，等计时器运行结束后也会自动释放的
        Heartbeat.sharedInstance.delisten("beat")
        Heartbeat.sharedInstance.delisten("apple")
    }

}

