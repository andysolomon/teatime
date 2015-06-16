//
//  RecipeData.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import Foundation

let RecipeData: [[String:AnyObject]] = [
    [   "type": "Green",
        "category": "Jasmine",
        "name": "Johhny's Jazz",
        "steps": 4,
        "numOfReviews": 4,
        "reviews": "Love this place",
        "creator": "John Jackson"
    ],
    [   "type": "Black",
        "category": "Boba Guys Blend No. 1",
        "name": "Boba Guys Blend No. 1",
        "steps": 4,
        "numOfReviews": 4,
        "reviews": "Love this place",
        "creator": "John Jackson"
    ],
    [   "type": "Herbal",
        "category": "Chamomile",
        "name": "Henry's Chamo",
        "steps": 4,
        "numOfReviews": 4,
        "reviews": "Love this place",
        "creator": "Henry Harrison"
    ]
    
]

func getIconType(icon: String) -> String? {
    switch icon {
    case "Black":
        return "black"
    case "Green":
        return "green"
    case "Puerh":
        return "puerh"
    case "Oolong":
        return "oolong"
    case "White":
        return "white"
    case "Herbal":
        return "herbal"
    default:
        return ""
    }
}