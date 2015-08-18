//
//  RecordedAudio.swift
//  Pitch Perfect 2
//
//  Created by MIRKO on 5/27/15.
//  Copyright (c) 2015 XZM. All rights reserved.
//

import Foundation

class RecordedAudio {
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL , title: String){
        self.filePathUrl = filePathUrl
        self.title = title
    }
}
