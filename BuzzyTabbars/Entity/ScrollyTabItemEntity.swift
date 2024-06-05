//
//  ScrollyTabItemEntity.swift
//
//  Created by Malti Maurya on 29/05/24.
//

import Foundation
import SwiftUI

public struct ScrollyTabItemEntity {
    public var title: String?
    public var image: Image?
    public var subtitle: String?
    public var isSelected: Bool
    
    public init(title: String? = nil, subtitle: String = "", image: Image? = nil, isSelected: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.isSelected = isSelected
    }
}
