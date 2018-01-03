//
//  TimeLineViewController.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 2..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    let tempPosts:[Post] = [Post(postID: 0, thumbnail: "thumbnail.png",
                          nickName: "cheese", userID: "@cheese",
                          saveTime: TimeInterval().now().minusHour(hourAmount: 3),
                          contents: "3시간 전에 쓴 포스트입니다", imageContents: nil),
                     Post(postID: 1, thumbnail: "thumbnail.png",
                          nickName: "cheese", userID: "@cheese",
                          saveTime: TimeInterval().now().minusHour(hourAmount: 2),
                          contents: "2시간 전에 쓴 포스트입니다", imageContents: nil),
                     Post(postID: 2, thumbnail: "thumbnail.png",
                          nickName: "cheese", userID: "@cheese",
                          saveTime: TimeInterval().now().minusHour(hourAmount: 1),
                          contents: "1시간 전에 쓴 포스트입니다", imageContents: "contents.jpg"),
                     Post(postID: 3, thumbnail: "thumbnail.png",
                          nickName: "cheese", userID: "@cheese",
                          saveTime: TimeInterval().now(),
                          contents: "방금 쓴 포스트입니다", imageContents: nil)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension TimeLineViewController : ImagePostTableViewCellDelegate {
    func mentionPost(id: Int) {
        print("click mention post \(id)")
    }
    
    func sharePost(id: Int) {
        print("click share post \(id)")
    }
    
    func starPost(id: Int) {
        print("click star post \(id)")
    }
}

extension TimeLineViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentPost = tempPosts[indexPath.row]
        if currentPost.haveImageContents() {
            let cell = Bundle.main.loadNibNamed("ImagePostTableViewCell", owner: nil, options: nil)?.first as! ImagePostTableViewCell
            cell.setPostInfo(post: currentPost)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        let cell = Bundle.main.loadNibNamed("TextPostTableViewCell", owner: nil, options: nil)?.first as! TextPostTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tempPosts[indexPath.row].haveImageContents() {
            return 200.0
        }
        return 100.0
    }
    
}

extension TimeLineViewController : UITableViewDelegate {
    
}
