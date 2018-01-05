//
//  Heartbeat.swift
//  QCMerchant
//
//  Created by app on 2017/12/16.
//  Copyright © 2017年 qicai. All rights reserved.
//

import Foundation

let maxInteval: Int = 10000

class Heartbeat: NSObject {
    static let sharedInstance = Heartbeat()
    private var timer:Timer!
    private var listeners: [HBListener]? = []
    private var internalPoint: Int = 0 //心跳时间点 每次跳动加1
    
    ///开启心跳
    func run() -> Void {
        // 启用计时器，控制每秒执行一次tickDown方法
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target:self,selector:#selector(Heartbeat.tickDown), userInfo:nil,repeats:true)
        }
    }
    
    ///暂停心跳
    func pause() -> Void {
        self.timer.fireDate = Date.distantFuture
    }
    
    ///恢复心跳
    func start() -> Void {
        self.timer.fireDate = NSDate.init() as Date
    }
    
    @objc private func tickDown() {
        
        self.internalPoint = (self.internalPoint + 1) % maxInteval
        if let listeners = self.listeners {
            for listener in listeners {
                if listener.times! == 0 || listener.Donetimes < listener.times! {
                    let point: Int = self.internalPoint - listener.startInteval!
                    if point % listener.inteval! == 0 {
                        listener.beat!(point)
                        listener.Donetimes += 1
                    }
                }else {
                    listener.delete = true
                }
            }
            var tempList: [HBListener] = []
            for listener in listeners {
                if listener.delete == false {
                    tempList.append(listener)
                }
            }
            self.listeners = tempList
        }
    }
    
    ///监听心跳
    func listen(name: String, inteval: Int, times: Int ,beat: @escaping ((_ point :Int) -> Void)) -> Void {
        let listener = HBListener()
        listener.name = name
        listener.inteval = inteval
        listener.startInteval = self.internalPoint
        listener.times = times
        listener.beat = beat
        
        var ret: Bool = true
        if let listeners = self.listeners {
            for item in listeners {
                if item.name == listener.name {
                    ret = false
                    break
                }
            }
        }
        
        if ret {
            self.listeners?.append(listener)
        }
    }
    
    func delisten(_ name: String) -> Void {
        self.timer.fireDate = Date.distantFuture
        
        if let list = self.listeners {
            for i in 0 ..< list.count {
                let item = list[i]
                if item.name == name {
                    self.listeners!.remove(at: i)
                    break;
                }
            }
        }
        
        self.timer.fireDate = NSDate.init() as Date
    }
}
