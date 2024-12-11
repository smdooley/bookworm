//
//  Extensions.swift
//  Bookworm
//
//  Created by Sean Dooley on 04/12/2024.
//

import Foundation

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
