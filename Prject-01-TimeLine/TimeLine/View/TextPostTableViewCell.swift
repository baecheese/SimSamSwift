//
//  TextPostTableViewCell.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 3..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import UIKit

class TextPostTableViewCell: UITableViewCell {

    var postID:Int?
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func setPostInfo(post:Post) {
        self.postID = post.postID
        self.thumbnail.image = UIImage(named: post.thumbnail)
        self.nickname.text = post.nickName
        self.userID.text = post.nickName
        self.contents.text = post.contents
        self.time.text = TimeInterval.getTwitterTime(saveTime: post.saveTime)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var delegate:PostTableViewCellDelegate?
    
    @IBAction func clickButton(_ sender: UIButton) {
        if let selectPostID = postID {
            if CellAction.metion.tag() == sender.tag {
                delegate?.mentionPost(id: selectPostID)
            }
            else if CellAction.share.tag() == sender.tag {
                delegate?.sharePost(id: selectPostID)
            }
            else if CellAction.star.tag() == sender.tag {
                delegate?.starPost(id: selectPostID)
            }
        }
    }
    
}
