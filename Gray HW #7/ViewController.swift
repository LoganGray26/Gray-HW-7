//
//  ViewController.swift
//  Gray HW #7
//
//  Created by logan gray on 5/3/20.
//  Copyright © 2020 logan gray. All rights reserved.
//

import UIKit
import MessageUI
import WebKit

class ViewController: UIViewController, MFMailComposeViewControllerDelegate,  MFMessageComposeViewControllerDelegate {
    
    @IBAction func sendText(_ sender: Any){
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = ["7245549112"]
        composeVC.body = "Hello. This is being sent for my app!"
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        }
        else {
            print("Can't send message.")
        }
        
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
    
    @IBOutlet var webView: WKWebView!
    
    
    
    @IBAction func openWeb(_ sender: Any) {
        if let URL = URL(string:
            "https://www.visitmyrtlebeach.com/") {
            UIApplication.shared.open(URL, options: [:])
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let myURL = URL(string: "https://www.visitmyrtlebeach.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
