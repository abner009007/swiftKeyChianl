//
//  KeychainTool.swift
//  swiftKeyChianl
//
//  Created by 云中科技 on 2017/10/11.
//  Copyright © 2017年 云中科技. All rights reserved.
//

import UIKit
import Security





class KeychainTools : NSObject{
    
    static func deletekeychina(removeDataNameKey:String) {
        
        let query : [NSString : AnyObject] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : removeDataNameKey as AnyObject]
        
        let status = SecItemDelete(query as CFDictionary)
        status == errSecSuccess ? print("删除成功处理") : print("删除SHIBAI")
    }
    
    static func getkeychina(getDataNameKey:String) -> (String) {
        
        var result = "";
        
        let requestQuery : [NSString : AnyObject] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : getDataNameKey as AnyObject,
            kSecReturnAttributes : true as AnyObject,
            kSecReturnData : true as AnyObject
        ]
        
        var requestResult : AnyObject?
        let err = SecItemCopyMatching(requestQuery as CFDictionary, &requestResult)
        if err == errSecSuccess
        {
            if let results = requestResult as? [NSString : AnyObject],
                let username = results[kSecAttrAccount] as? String
            {
                result = username;
            }
        }
        else if err == errSecItemNotFound
        {
            result = "获取不到文件"
        }
        else
        {
            result = "获取失败"
        }
        
        return result;
    }
    
    static func addkeychina(addDataNameKey:String,addDataValue:String) {
        
        let addQuery : [NSString : AnyObject] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : addDataNameKey as AnyObject,
            kSecAttrAccount : addDataValue as AnyObject,
            ]
        let result = SecItemAdd(addQuery as CFDictionary, nil)
        result == errSecSuccess ? print("添加成功") : print("添加失败")
    }
}
