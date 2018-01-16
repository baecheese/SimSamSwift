//
//  ViewController.swift
//  LimitTextEditor
//
//  Created by 배지영 on 2018. 1. 5..
//  Copyright © 2018년 ChesseFactory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    private var toolBar = UIToolbar()
    private var countingText = UIBarButtonItem()
    
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
        toolBar.backgroundColor = .yellow
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
        if 51 == textview.text.count {
            toolBar.backgroundColor = .orange
        }
        else if 50 == textView.text.count {
            toolBar.backgroundColor = .yellow
        }
    }
    
}

