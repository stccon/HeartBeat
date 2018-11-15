## 一、HeartBeat的介绍

HeatBeat计时器通过一个实例可以同时管理app中多个单一或者多个页面的计时，即使页面关闭了也可以继续计时。HeatBeat计时器使用简单明了，性能卓越。可便捷的应用于各种倒计时场景（如消息发送倒计时、商品优惠倒计时等等）。

## 二、如何使用HeartBeat

1、swift项目使用方式
开启：

```
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
```
释放：

```
deinit {
   //"beat"是有限次的计时器，即使这里不手动释放，等计时器运行结束后也会自动释放的
   Heartbeat.sharedInstance.delisten("beat")
   Heartbeat.sharedInstance.delisten("apple")
}
```
2、OC项目使用方式

在项目配置好桥接的前提下。

开启：

```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[Heartbeat sharedInstance] run];
    [[Heartbeat sharedInstance] listenWithName:@"beat" inteval:3 times:5 beat:^(NSInteger point) {
        NSLog(@"beat%li", (long)point);
    }];
}
```

## 三、联系我

acontton@foxmail.com

