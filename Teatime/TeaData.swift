//
//  TeaData.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/17/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import Foundation

class Recipe {
    func recipe__steps() {}
}

class Steps {
}

var recipes: [[String:AnyObject]] = [
    [
        "name": "Rose Black Tea",
        "id": 101
    ],
    [
        "name": "Boba Guys Blend No.1",
        "id": 102
    ]
]


var stepList101: [[String:String]] = [
    [
        "stepName": "Add Tea Leaves",
        "instructions": "Add 1tsp of tea",
        "duration": "300",
        "id": "1001"
    ],
    [
        "stepName": "Pour Water",
        "instructions":"Pour water into brewer and lid",
        "duration": "300",
        "id": "1002"
    ],
    [
        "stepName": "Boil Water",
        "instructions":"Bring the water to 200F",
        "duration": "500",
        "id": "1003"
    ],
    [
        "stepName": "Let Steep",
        "instructions":"Give the tea sometime to steep properly",
        "duration": "900",
        "id": "1004"
    ],
    [
        "stepName": "Pour Tea",
        "instructions": "Make sure to decant excess liquid to prevent tea from over steeping.",
        "duration": "10",
        "id": "1005"
    ]
]

var stepList102: [[String:String]] = [
    [
        "stepName": "Slowly Add Tea Leaves",
        "instructions": "Add 1tsp of tea",
        "duration": "300",
        "id": "1001"
    ],
    [
        "stepName": "Pour Water",
        "instructions":"Pour water into brewer and lid",
        "duration": "300",
        "id": "1002"
    ],
    [
        "stepName": "Boil Water",
        "instructions":"Bring the water to 200F",
        "duration": "500",
        "id": "1003"
    ],
    [
        "stepName": "Let Steep",
        "instructions":"Give the tea sometime to steep properly",
        "duration": "900",
        "id": "1004"
    ],
    [
        "stepName": "Pour Tea",
        "instructions": "Make sure to decant excess liquid to prevent tea from over steeping.",
        "duration": "10",
        "id": "1005"
    ]
]