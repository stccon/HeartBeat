//
//  HBListener.swift
//  QCMerchant
//
//  Created by app on 2017/12/20.
//  Copyright © 2017年 qicai. All rights reserved.
//

import UIKit

class HBListener: NSObject {
    var name: String?
    var inteval: Int? //时间间隔
    var startInteval: Int? //起始心跳点
    var times: Int? //执行次数
    var Donetimes: Int = 0 //已经运行的次数
    var beat: ((_ point: Int)->Void)?
    
    var delete: Bool = false //标记删除
    
}
