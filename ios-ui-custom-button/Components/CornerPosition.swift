//
//  CornerPosition.swift
//  ios-ui-custom-button
//
//  Created by Lionel P. Albus on 5/8/21.
//

import Foundation
import UIKit

enum CornerPosition {
    case none
    case top
    case both
    case left
    case right
    case topLeft
    case topRight
    case bothLeft
    case bothRight
    case all
    case ignoreTopLeft
    case ignoreTopRight
    case ignoreBothLeft
    case ignoreBothRight
    
    static func initWith(position: Int) -> Self {
        switch position {
        case 1:
            return .top
        case 2:
            return .both
        case 3:
            return .left
        case 4:
            return .right
        case 5:
            return .topLeft
        case 6:
            return .topRight
        case 7:
            return .bothLeft
        case 8:
            return .bothRight
        case 9:
            return .all
        case 10:
            return .ignoreTopLeft
        case 11:
            return .ignoreTopRight
        case 12:
            return .ignoreBothLeft
        case 13:
            return .ignoreBothRight
        default:
            return .none
        }
    }
    
    var number: Int {
        switch self {
        case .top:
            return 1
        case .both:
            return 2
        case .left:
            return 3
        case .right:
            return 4
        case .topLeft:
            return 5
        case .topRight:
            return 6
        case .bothLeft:
            return 7
        case .bothRight:
            return 8
        case .all:
            return 9
        case .ignoreTopLeft:
            return 10
        case .ignoreTopRight:
            return 11
        case .ignoreBothLeft:
            return 12
        case .ignoreBothRight:
            return 13
        default:
            return 0
        }
    }
    
    var mask: CACornerMask {
        switch self {
        case .top:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .both:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .left:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .right:
            return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .topLeft:
            return [.layerMinXMinYCorner]
        case .topRight:
            return [.layerMaxXMinYCorner]
        case .bothLeft:
            return [.layerMinXMaxYCorner]
        case .bothRight:
            return [.layerMaxXMaxYCorner]
        case .all:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .ignoreTopLeft:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,
                    .layerMaxXMinYCorner]
        case .ignoreTopRight:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,
                    .layerMinXMinYCorner]
        case .ignoreBothLeft:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner,
                    .layerMaxXMaxYCorner]
        case .ignoreBothRight:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        default:
            return []
        }
    }
}
