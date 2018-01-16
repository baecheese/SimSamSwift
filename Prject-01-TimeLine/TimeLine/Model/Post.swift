//
//  Post.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 2..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import Foundation

struct Post {
    let postID: Int
    let thumbnail: String
    let nickName: String
    let userID: String
    let saveTime: TimeInterval
    let contents: String
    let imageContents: String?
    
    func haveImageContents() -> Bool {
        if nil != imageContents {
            return true
        }
        return false
    }
}
