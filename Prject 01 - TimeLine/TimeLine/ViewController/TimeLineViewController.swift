//
//  TimeLineViewController.swift
//  TimeLine
//
//  Created by 배지영 on 2018. 1. 2..
//  Copyright © 2018년 SimpleSampleSwift. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

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
    func answerPost(id: Int) {
        print("click anwser post \(id)")
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ImagePostTableViewCell", owner: nil, options: nil)?.first as! ImagePostTableViewCell
        let post = Post(postID: indexPath.row, thumbnail: "thumbnail.jpeg", nickName: "user", userID: "@user", time: "12:00", contents: "content test", imageContents: "contents.jpg")
        cell.setPostInfo(post: post)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

extension TimeLineViewController : UITableViewDelegate {
    
}
