//
//  ImagePostTableViewCell.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 2..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import UIKit

enum CellAction : Int {
    case metion = 0
    case share = 1
    case star = 2
    
    func tag() -> Int {
        return self.rawValue
    }
    
}

protocol PostTableViewCellDelegate {
    func mentionPost(id:Int)
    func sharePost(id:Int)
    func starPost(id:Int)
}

class ImagePostTableViewCell: UITableViewCell {

    var delegate:PostTableViewCellDelegate?
    var postID:Int?
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var imageContents: UIImageView!
    
    func setPostInfo(post:Post) {
        self.postID = post.postID
        self.thumbnail.image = UIImage(named: post.thumbnail)
        self.nickName.text = post.nickName
        self.userID.text = post.userID
        self.time.text = TimeInterval.getTwitterTime(saveTime: post.saveTime)
        self.contents.text = post.contents
        self.contents.contentMode = .scaleAspectFill
        self.imageContents.image = UIImage(named: post.imageContents!)
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        // tag 0 답변 / 1 리트윗 / 2 마음
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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
