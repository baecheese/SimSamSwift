//
//  ViewController.swift
//  LimitTextEditor
//
//  Created by 배지영 on 2018. 1. 5..
//  Copyright © 2018년 ChesseFactory. All rights reserved.
//

import UIKit

enum LimitTextStatus {
    case none
    case warning
    
    func color() -> UIColor {
        switch self {
        case .none:
            return UIColor.yellow
        case .warning:
            return UIColor.orange
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    private var toolBar = UIToolbar()
    private var countingText = UIBarButtonItem()
    
    private var currentStatus = LimitTextStatus.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.delegate = self
        addToolBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func addToolBar() {
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.backgroundColor = LimitTextStatus.none.color()
        toolBar.tintColor = .black
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        countingText = UIBarButtonItem(title: "0 / 50", style: .done, target: nil, action: nil)
        toolBar.setItems([space, countingText], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textview.inputAccessoryView = toolBar
    }
    
}

extension ViewController : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        countingText.title = "\(textview.text.count) / 50"
        if 50 < textView.text.count &&
            currentStatus == LimitTextStatus.none {
            toolBar.backgroundColor = LimitTextStatus.warning.color()
            currentStatus = LimitTextStatus.warning
        }
        else if textView.text.count <= 50 &&
            currentStatus == LimitTextStatus.warning {
            toolBar.backgroundColor = LimitTextStatus.none.color()
            currentStatus = LimitTextStatus.none
        }
    }
    
}

