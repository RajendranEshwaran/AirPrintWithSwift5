//
//  ViewController.swift
//  AirPrintWithSwift5
//
//  Created by gomathi saminathan on 1/17/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func takePrint(sender : UIBarButtonItem)
    {
        printOperation()
    }
     func printOperation()
     {
      //1 Present UI and Manage printing
        let printerController = UIPrintInteractionController.shared
        
    //2 object contains information about the print job, This information is assigned to the printInfo property of the UIPrintInteractionController
        
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "Print Job"
        printerController.printInfo = printInfo
        
    //3 The printing text can be formatted. here we define the insets for the printing page
        let formatter = UIMarkupTextPrintFormatter(markupText: contentView.text)
        formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printerController.printFormatter = formatter
        
        printerController.present(animated: true, completionHandler: nil)
     }

}

