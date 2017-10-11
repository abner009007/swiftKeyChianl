//
//  ViewController.swift
//  swiftKeyChianl
//
//  Created by 云中科技 on 2017/10/11.
//  Copyright © 2017年 云中科技. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.red;
        
        let titles = ["增加","删除","读取"];
        
        let width = self.view.bounds.size.width/4.0;
        
        for index in 0..<3
        {
            let button = UIButton.init(type: .custom);
            button.tag = index;
            button.frame = CGRect(x:width*CGFloat(index),y:100,width:width,height:30);
            button.setTitle(titles[index], for: .normal);
            button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside);
            self.view.addSubview(button);
        }
        
        
        
        
        
        
        
    }
    func buttonClick(_ button:UIButton) {
        
        switch button.tag {
        case 0:
            KeychainTools.addkeychina(addDataNameKey: "abner",addDataValue: "1111111111111");
        case 1:
            KeychainTools.deletekeychina(removeDataNameKey: "abner");
        case 2:
            let result = KeychainTools.getkeychina(getDataNameKey:"abner");
            print("===============",result)
        default:
            print("666666666666666");
        }
        
    }
    


}

