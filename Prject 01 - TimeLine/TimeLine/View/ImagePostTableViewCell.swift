//
//  ImagePostTableViewCell.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 2..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import UIKit

protocol ImagePostTableViewCellDelegate {
    func answerPost(id:Int)
    func sharePost(id:Int)
    func starPost(id:Int)
}

class ImagePostTableViewCell: UITableViewCell {

    var delegate:ImagePostTableViewCellDelegate?
    var postID:Int?
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var imageContents: UIImageView!
    
    func setPostInfo(post:Post) {
        settingCell(id: post.postID, thumbnail: post.thumbnail,
                    nickName: post.nickName, userID: post.userID,
                    time: post.time, contents: post.contents,
                    imageContents: post.imageContents)
    }
    
    private func settingCell(id:Int, thumbnail:String, nickName:String, userID:String, time:String, contents:String, imageContents:String) {
        self.postID = id
        self.thumbnail = UIImageView(image: UIImage(named: thumbnail))
        self.nickName.text = nickName
        self.userID.text = userID
        self.time.text = time // TimeInterval로 변경 (to do)
        self.contents.text = contents
        self.imageContents = UIImageView(image: UIImage(named: contents))
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        // tag 0 답변 / 1 리트윗 / 2 마음
        if let selectPostID = postID {
            if 0 == sender.tag {
                delegate?.answerPost(id: selectPostID)
            }
            else if 1 == sender.tag {
                delegate?.sharePost(id: selectPostID)
            }
            else if 2 == sender.tag {
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
