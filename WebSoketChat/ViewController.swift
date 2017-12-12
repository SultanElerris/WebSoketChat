//
//  ViewController.swift
//  WebSoketChat
//
//  Created by Sultan Sultan on 12/12/17.
//  Copyright © 2017 Sultan Sultan. All rights reserved.
//

import Starscream
import StompClientLib


import UIKit

class ViewController: UIViewController {
    
    var socketClient = StompClientLib()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remember to change the token
        let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqYW1lczJAeWFob28uY29tMiIsImlkIjoiNWEzMDIyN2FkNzczODkwODA3NzA3NmQ1Iiwicm9sZSI6IlJPTEVfVVNFUiJ9.qX2NRO4JgeG72cmjbWqrPsfcHOkNpGv9gKpm9XK3j1Yzatc1AfjOMr6wqFmpU_2kRZUpt_azGp-pcitydGCNaA"
        
        let url = NSURL(string:"ws://localhost:8080/ws?auth=\(token)")!
        socketClient.openSocketWithURLRequest(request: NSURLRequest(url: url as URL) , delegate: self as StompClientLibDelegate)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// StompClient Delegate Methods
extension ViewController: StompClientLibDelegate {
    func stompClientDidConnect(client: StompClientLib!) {
        print("Socket is connected")
        // Stomp subscribe will be here!
        //socketClient.subscribe(destination: topic)
        // Note : topic needs to be a String object
    }
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Socket is Disconnected")
    }
    func stompClientWillDisconnect(client: StompClientLib!, withError error: NSError) {
        
    }
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, withHeader header: [String : String]?, withDestination destination: String) {
        print("Destination : \(destination)")
        print("JSON Body : \(String(describing: jsonBody))")
    }
    func stompClientJSONBody(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        print("DESTIONATION : \(destination)")
        print("String JSON BODY : \(String(describing: jsonBody))")
    }
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("Receipt : \(receiptId)")
    }
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("Error Send : \(String(describing: message))")
    }
    
    func serverDidSendPing() {
        print("Server ping")
    }
}

