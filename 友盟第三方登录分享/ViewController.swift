//
//  ViewController.swift
//  友盟第三方登录分享
//
//  Created by Xinxibin on 16/10/21.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isGetUserInfo = false
    @IBOutlet weak var weiboTextVie: UITextView!
    @IBOutlet weak var weixinTextVie: UITextView!
    @IBOutlet weak var qqTextVie: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 开关管理是否获取用户数据
    @IBAction func onGetUserInfo(_ sender: AnyObject) {
        
        let st = sender as? UISwitch
        
        
        isGetUserInfo = (st?.isOn)!
    }
    
    @IBAction func getAuthInforFromWechat(sender:UIButton) {
        
        if !isGetUserInfo {
            
            getAuthInfoFromWechatUser(withVC: self, completion: { (info, error) -> (Void) in
                
                self.weixinTextVie.text = "Wechat — uid:\(info?.uid) accessToken:\(info?.accessToken)"
            })
        
        } else {
            
            getUserInfo(withType: UMSocialPlatformType.wechatSession, withVC: self, completion: { (info, error) -> (Void) in

                self.weixinTextVie.text = "Wechat + name:\(info?.name) icon:\(info?.iconurl) gender:\(info?.gender)"
            })
        }
    }
    
    @IBAction func getAuthInforFromSina(sender:UIButton) {

        if !isGetUserInfo {
            
            getAuthInfoFromSinaUser(withVC: self , completion: { (info, error) in
                self.weiboTextVie.text = "sina +  — uid:\(info?.uid) accessToken:\(info?.accessToken)"
            })
            
        }else {
            
            getUserInfo(withType: UMSocialPlatformType.sina, withVC: self, completion: { (info, error) -> (Void) in
                self.weiboTextVie.text = "Sina +  name:\(info?.name) icon:\(info?.iconurl) gender:\(info?.gender)"
            })
        }

    }
    
    @IBAction func getAuthInforFromQQ(sender:UIButton) {
        if !isGetUserInfo {
            
            getAuthInfoFromQQUser(withVC: self, completion: { (info, error) -> (Void) in
                self.qqTextVie.text = "QQ +  — uid:\(info?.uid) accessToken:\(info?.accessToken)"
            })
        }else {
            
            getUserInfo(withType: UMSocialPlatformType.QQ, withVC: self, completion: { (info, error) -> (Void) in
                self.qqTextVie.text = "QQ +  name:\(info?.name) icon:\(info?.iconurl) gender:\(info?.gender)"
            })
        }
    }
    
    @IBAction func onShareUIButtonClick(_ sender: AnyObject) {
        
        
        UMSocialUIManager.showShareMenuViewInWindow { (shareSelectionView:UMShareMenuSelectionView?, type:UMSocialPlatformType) in
            
        }
    }
    
    @IBAction func onShareButton(_ sender: UIButton) {
        
        var type : UMSocialPlatformType = .sina
        switch sender.tag {
        case 1:
            type = .sina
            shareImageAndTextToPlatformType(platformType: type, withVC: self) { (success) -> (Void) in
                print("分享成功：\(success)")
            }
            return
        case 2:
            type = .wechatSession
            shareVideoToPlatformType(platformType: type, withVC: self, completion: { (success) -> (Void) in
                print("分享成功：\(success)")
            })
            return
        case 3:
            type = .QQ
            shareMusicToPlatformType(platformType: type, withVC: self, completion: { (success) in
                print("分享成功：\(success)")
            })
            return

        case 4:
            type = .wechatTimeLine
            shareWebPageToPlatformType(platformType: type, withVC: self, completion: { (success) in
                print("分享成功：\(success)")
            })
            return

        case 5:
            type = .qzone
            shareImageToPlatformType(platformType: type, withVC: self, completion: { (success) in
                print("分享成功：\(success)")
            })
            return

        default:
            break
        }
        
        
    }
    
}



