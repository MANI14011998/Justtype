//
//  DocumentViewController.swift
//  justType
//
//  Created by MANINDER SINGH on 06/10/19.
//  Copyright © 2019 MANINDER SINGH. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    
    @IBOutlet var textView: UITextView!
    var document: Document?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.textView.text = self.document?.text ?? ""
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}
