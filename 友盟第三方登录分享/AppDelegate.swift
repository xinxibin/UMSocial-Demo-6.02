//
//  AppDelegate.swift
//  友盟第三方登录分享
//
//  Created by Xinxibin on 16/10/21.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        useUMengSocialData()
        
        return true
    }
    
    func useUMengSocialData() {
                
        UMSocialManager.default().openLog(true)
        UMSocialManager.default().umSocialAppkey = ""
        print("Umeng social version : \(UMSocialGlobal.umSocialSDKVersion())")

        // 设置微博的appkey
        UMSocialManager.default().setPlaform(UMSocialPlatformType.sina, appKey: "", appSecret: "", redirectURL: "http://sns.whalecloud.com/sina2/callback")
        
        // 设置qq的appkey
        UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: "", appSecret: "", redirectURL: "http://www.baidu.com")
        
        // 设置weixin的appkey
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: "", appSecret: "", redirectURL: "http://mobile.umeng.com/social")

    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let result = UMSocialManager.default().handleOpen(url)
        
        if !result {
            // 其他如支付等sdk 的回调
        }
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let result = UMSocialManager.default().handleOpen(url)
        
        if !result {
            // 其他如支付等sdk 的回调
        }
        return true
    }
    
    func canOpenURL(_ url: URL) -> Bool {
        
        return true
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

