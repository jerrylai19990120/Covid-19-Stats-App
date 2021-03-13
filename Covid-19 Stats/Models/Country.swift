//
//  Country.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import SwiftUI

struct Country: Hashable {
    var name: String
    var countryCode: String
    var totalInfected: Int
    var active: Int
    var recovered: Int
    var deaths: Int
}
