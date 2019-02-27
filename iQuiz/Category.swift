//
//  Category.swift
//  iQuiz
//
//  Created by Personal on 2/12/19.
//  Copyright © 2019 Benjamin Shi. All rights reserved.
//

import UIKit

class Category {
    var title: String
    var subtitle: String
    var questions: [String]
    var image: UIImage
    
    init(title: String, subtitle: String, questions: [String], imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.questions = questions
        self.image = UIImage(named: imageName)!
    }
}

