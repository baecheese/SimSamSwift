//
//  ImagePostTableViewCell.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 2..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import UIKit

protocol ImagePostTableViewCellDelegate {
    func mentionPost(id:Int)
    func sharePost(id:Int)
    func starPost(id:Int)
}

class ImagePostTableViewCell: UITableViewCell {

    var delegate:ImagePostTableViewCellDelegate?
    var postID:Int?
    @IBOutlet weak var thumbnail: UIImageView!//
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var imageContents: UIImageView!//
    
    func setPostInfo(post:Post) {
        settingCell(id: post.postID, thumbnail: post.thumbnail,
                    nickName: post.nickName, userID: post.userID,
                    time: TimeInterval.getTwitterTime(saveTime: post.saveTime), contents: post.contents,
                    imageContents: post.imageContents!)
    }
    
    private func settingCell(id:Int, thumbnail:String, nickName:String, userID:String, time:String, contents:String, imageContents:String) {
        self.postID = id
        self.thumbnail = UIImageView(image: UIImage(named: thumbnail))
        self.nickName.text = nickName
        self.userID.text = userID
        self.time.text = time // TimeInterval로 변경 (to do)
        self.contents.text = contents
        self.imageContents = UIImageView(image: UIImage(named: imageContents))
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        // tag 0 답변 / 1 리트윗 / 2 마음
        if let selectPostID = postID {
            if CellAction.metion.rawValue == sender.tag {
                delegate?.mentionPost(id: selectPostID)
            }
            else if CellAction.share.rawValue == sender.tag {
                delegate?.sharePost(id: selectPostID)
            }
            else if CellAction.star.rawValue == sender.tag {
                delegate?.starPost(id: selectPostID)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

enum CellAction : Int {
    case metion = 0
    case share = 1
    case star = 2
}
