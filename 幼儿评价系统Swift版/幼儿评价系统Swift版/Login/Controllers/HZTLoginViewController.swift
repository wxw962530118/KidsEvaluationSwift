//
//  HZTLoginViewController.swift
//  幼儿评价系统Swift版
//
//  Created by 王新伟 on 2018/11/29.
//  Copyright © 2018年 wxw. All rights reserved.
//

import UIKit

class HZTLoginViewController: HZTBaseViewController {
    /**overall variable*/
    let whiteView = UIView.init(frame: CGRect(x: 0, y: 0, width: 600, height: 450))
    let kScreenW = UIScreen.main.bounds.size.width
    let kScreenH = UIScreen.main.bounds.size.height
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow(_ :)), name:UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHidden(_ :)), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func addBgImgView() {
        self.view.backgroundColor = UIColor.red
        let bgImgView = UIImageView.init(frame: self.view.bounds)
        bgImgView.image = UIImage.init(named:"login_bg")
        self.view.addSubview(bgImgView)
    }
    
    func addAccountSuperView() {
        whiteView.center = self.view.center
        whiteView.backgroundColor = UIColor.white
        whiteView.layer.cornerRadius = 15;
        whiteView.layer.masksToBounds = false
        self.view.addSubview(whiteView)
    }
    
    func addTopLogoImgView() {
        let logoImgView = UIImageView.init(frame: CGRect(x: (whiteView.frame.width - 150)/2, y:-75, width: 150, height: 150))
        logoImgView.image = UIImage.init(named:"login_icon_yuan")
        whiteView.addSubview(logoImgView)
    }
    
    func addTitleLabel() {
        let titleLabel = UILabel.init(frame: CGRect(x: 0, y:90, width: whiteView.frame.width, height: 30))
        titleLabel.text = "孩子通幼儿发展评价系统"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.orange
        whiteView.addSubview(titleLabel)
    }
    
    func addTextField() {
        let placeholderArr = [" 输入手机号码或账号"," 输入密码"]
        for i in 0 ..< placeholderArr.count {
            let textField = UITextField.init(frame: CGRect(x: 30, y: 200 + i * 50 + (i == 1 ? 20 : 0), width:Int(whiteView.frame.size.width) - 60, height: 50))
            textField.backgroundColor = UIColor.lightGray
            textField.layer.cornerRadius = 25;
            textField.layer.masksToBounds = true
            textField.tag = 1000 + i
            textField.placeholder = placeholderArr[i]
            whiteView.addSubview(textField)
        }
    }
    
    func addLoginBtn() {
        let loginBtn = UIButton.init(frame: CGRect(x: 30, y: Int(whiteView.frame.size.height) - 80, width: Int(whiteView.frame.size.width) - 60, height: 50))
        loginBtn.addTarget(self, action: #selector(clickLogin(_ :)), for: .touchUpInside)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor.orange
        loginBtn.layer.cornerRadius = 25;
        loginBtn.layer.masksToBounds = true;
        whiteView.addSubview(loginBtn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**注册监听*/
        self.addObservers()
        /**添加背景图*/
        self.addBgImgView()
        /**中间账号密码相关父级*/
        self.addAccountSuperView()
        /**添加顶部logo*/
        self.addTopLogoImgView()
        /**logon 下面的 title*/
        self.addTitleLabel()
        /**textFiled*/
        self.addTextField()
        /**登录按钮*/
        self.addLoginBtn()
    }

    //MARK:键盘出现
    @objc func keyBoardShow(_ noti: Notification) {
        //let duration = noti.userInfo?["UIKeyboardAnimationDurationUserInfoKey"]
        let keyboardRect : CGRect? = noti.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
        let keyboardHeight = keyboardRect?.size.height
        whiteView.center.y -= (keyboardHeight ?? 0 ) * 0.4
    }
    
    //MARK:键盘消失
    @objc func keyBoardHidden(_ noti: Notification) {
        //let duration = noti.userInfo?["UIKeyboardAnimationDurationUserInfoKey"]
        let keyboardRect : CGRect? = noti.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
        let keyboardHeight = keyboardRect?.size.height
        whiteView.center.y += (keyboardHeight ?? 0 ) * 0.4
    }

    //MARK:点击登录
    @objc func clickLogin(_ btn: UIButton){
      print("点击登录")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
