//
//  RecipeData.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import Foundation

let RecipeData: JSON = [
    [
        "type": "Green",
        "category": "Jasmine",
        "name": "Johhny's Jazz",
        "steps": 4,
        "numOfReviews": 4,
        "reviews": "Love this place",
        "creator": "John Jackson"
    ],
    [
        "type": "Black",
        "category": "Boba Guys Blend No. 1",
        "name": "Boba Guys Blend No. 1",
        "steps": [
            [
                "stepName": "Add Tea Leaves",
                "instructions": "Add 1tsp of tea",
                "duration": 300,
                "id": "1001"
            ],
            [
                "stepName": "Pour Water",
                "instructions": "Pour water into brewer and lid",
                "duration": 300,
                "id": "1002"
            ],
            [
                "stepName": "Boil Water",
                "instructions": "Bring the water to 200F",
                "duration": 500,
                "id": "1003"
            ],
            [
                "stepName": "Let Steep",
                "instructions": "Give the tea sometime to steep properly",
                "duration": 900,
                "id": "1004"
            ],
            [
                "stepName": "Pour Tea",
                "instructions": "Make sure to decant excess liquid to prevent tea from over steeping.",
                "duration": 10,
                "id": "1005"
            ]
        ],
        "numOfReviews": 4,
        "reviews": "Love this place",
        "creator": "John Jackson"
    ],
    [
        "type": "Herbal",
        "category": "Chamomile",
        "name": "Henry's Chamo",
        "steps": [
            [
                "stepName": "Slowly Add Tea Leaves",
                "instructions": "Add 1tsp of tea",
                "duration": 20,
                "id": "1001"
            ],
            [
                "stepName": "Pour Water",
                "instructions": "Pour water into brewer and lid",
                "duration": 10,
                "id": "1002"
            ],
            [
                "stepName": "Boil Water",
                "instructions": "Bring the water to 200F",
                "duration": 8,
                "id": "1003"
            ],
            [
                "stepName": "Let Steep",
                "instructions": "Give the tea sometime to steep properly",
                "duration": 30,
                "id": "1004"
            ],
            [
                "stepName": "Pour Tea",
                "instructions": "Make sure to decant excess liquid to prevent tea from over steeping.",
                "duration": 10,
                "id": "1005"
            ]
        ],
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