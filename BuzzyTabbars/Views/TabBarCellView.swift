//
//  TabBarCellView.swift
//
//  Created by Malti Maurya on 29/05/24.
//

import SwiftUI

struct TabBarCellView: View {
    @Binding var item: ScrollyTabItemEntity
    @State var tabInnerPadding: CGFloat = 20
    @State var tabbarHeight: CGFloat = 51
    @State var selectedTabBackgroundColor: Color = .clear
    @State var defaultTabBackgroundColor: Color = .clear
    
    var body: some View {
        VStack(spacing: 2) {
            CommonTextView(item: $item)
        }
        .frame(height: tabbarHeight)
        .padding(.horizontal, tabInnerPadding)
        .background(item.isSelected ? selectedTabBackgroundColor : defaultTabBackgroundColor)
    }
}

struct TabBarCellView2: View {
    @Binding var item: ScrollyTabItemEntity
    @State var tabInnerPadding: CGFloat = 20
    @State var tabbarHeight: CGFloat = 51
    @State var selectedTabBackgroundColor: Color = .clear
    @State var defaultTabBackgroundColor: Color = .clear
    
    var body: some View {
        VStack(spacing: 2) {
            CommonTextView(item: $item)
        }
        .frame(height: tabbarHeight)
        .padding(.horizontal, tabInnerPadding)
        .overlay {
            if item.isSelected {
                UnevenRoundedRectangle(topLeadingRadius: 10,
                                       bottomLeadingRadius: 0,
                                       bottomTrailingRadius: 0,
                                       topTrailingRadius: 10,
                                       style: .circular)
                .foregroundColor(Color.accentColor.opacity(0.2))
            }
        }
    }
}

struct CommonTextView: View {
    @Binding var item: ScrollyTabItemEntity
    @State var defaultTabfont: Font = .system(size: 14)
    @State var selectedTabFont: Font = .system(size: 14).bold()
    @State var selectedTabColor: Color = .black
    @State var defaultTabColor: Color = .gray
    var body: some View {
        if let title = item.title {
            Text(title)
                .font(item.isSelected ? selectedTabFont : defaultTabfont)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .foregroundColor(item.isSelected ? selectedTabColor : defaultTabColor)
        }
    }
}

struct TabBarCellView3: View {
    @Binding var item: ScrollyTabItemEntity
    @State var tabInnerPadding: CGFloat = 20
    @State var selectedTabBackgroundColor: Color = .clear
    @State var defaultTabBackgroundColor: Color = .clear
    
    var body: some View {
        VStack {
            CommonTextView(item: $item)
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, tabInnerPadding)
        .overlay {
            if item.isSelected {
                RoundedRectangle(cornerRadius: 30, style: .circular)
                .foregroundColor(Color.accentColor.opacity(0.5))
            }
        }
    }
}

struct TabBarCellView4: View {
    @Binding var item: ScrollyTabItemEntity
    @State var tabInnerPadding: CGFloat = 0
    @State var defaultTabfont: Font = .system(size: 14)
    @State var selectedTabFont: Font = .system(size: 14).bold()
    @State var selectedTabColor: Color = .black
    @State var defaultTabColor: Color = .gray
    @State var selectedTabBackgroundColor: Color = .clear
    @State var defaultTabBackgroundColor: Color = .clear
    
    var body: some View {
        HStack(spacing: 10){
            Spacer()
            if let image = item.image {
                image
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(item.isSelected ? .black : .gray)
                    .frame(width: 20, height: 20)
            }
            if item.isSelected {
                CommonTextView(item: $item)
            }
            Spacer()
        }
        .frame(width: item.isSelected ? .infinity : 60, height: 42)
        .background(item.isSelected ? Color.accentColor.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
    
}
