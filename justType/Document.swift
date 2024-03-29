//
//  Document.swift
//  justType
//
//  Created by MANINDER SINGH on 06/10/19.
//  Copyright © 2019 MANINDER SINGH. All rights reserved.
//

import UIKit
enum FileError:Error{
    case invalidData
}
class Document: UIDocument {
    
    var text = ""
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data(text.utf8)
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        guard let contents = contents as? Data else {
            throw FileError.invalidData
        }
        text = String(decoding:contents,as: UTF8.self)
    }
}

