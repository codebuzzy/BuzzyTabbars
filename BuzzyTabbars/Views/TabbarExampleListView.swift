//
//  TabbarExampleListView.swift
//
//  Created by Malti Maurya on 28/05/24.
//

import SwiftUI

struct TabbarExampleListView: View {
    @State var tabbarHeight: CGFloat = 51
    @State var backgroundColor: Color = .white
    var didSelectTab: ((Bool) -> Void)?
    @State var tabList: [ScrollyTabItemEntity] = []
    @State var tabList2: [ScrollyTabItemEntity] = []
    @State var tabList3: [ScrollyTabItemEntity] = []
    @State var tabList4: [ScrollyTabItemEntity] = []
    @State var tabList5: [ScrollyTabItemEntity] = [ScrollyTabItemEntity(title: "Title 1", image: Image(systemName: "house"), isSelected: true),
                                                   ScrollyTabItemEntity(title: "Title 2", image: Image(systemName: "gearshape")),
                                                   ScrollyTabItemEntity(title: "Title 3", image: Image(systemName: "person.crop.circle")),
                                                   ScrollyTabItemEntity(title: "Title 4", image: Image(systemName: "shazam.logo"))]
    
    var body: some View {
        VStack(spacing: 20) {
            TabbarStye1
            TabbarStye2
            TabbarStye3
            TabbarStye4
            TabbarStye5
        }.onAppear {
            tabList = fetchMockData()
            tabList2 = fetchMockData()
            tabList3 = fetchMockData()
            tabList4 = fetchMockData()
        }
    }
 
    var tabWidth: CGFloat? {
        if tabList.count <= 2 { return UIScreen.main.bounds.width / CGFloat(tabList.count)
        } else {
            return UIScreen.main.bounds.width / CGFloat(tabList.count)
        }
    }
    
    func fetchMockData() -> [ScrollyTabItemEntity] {
        return [ScrollyTabItemEntity(title: "Title 1", isSelected: true),
                ScrollyTabItemEntity(title: "Title 2"),
                ScrollyTabItemEntity(title: "Title 3"),
                ScrollyTabItemEntity(title: "Title 4")]
    }
}

// MARK: Tabbar Styles
extension TabbarExampleListView {
    
    var TabbarStye1: some View {
        VStack {
            Text("TabbarStye1")
            Divider()
            container { scrollProxy in
                ForEach(tabList.indices, id: \.self) { position in
                    TabBarCellView(item: $tabList[position])
                        .contentShape(Rectangle())
                        .frame(width: tabWidth)
                        .onTapGesture {
                            tabList.mapData(\.isSelected, false)
                            withAnimation {
                                tabList[position].isSelected = true
                                scrollProxy.scrollTo(position, anchor: .center)
                            }
                            didSelectTab?(tabList[position].isSelected)
                        }
                        .id(position)
                    Divider()
                }
            }
            Divider()
        }
    }
    
    var TabbarStye2: some View {
        VStack(spacing: 0) {
            Text("TabbarStye2")
            container { scrollProxy in
                ForEach(tabList2.indices, id: \.self) { position in
                    TabBarCellView2(item: $tabList2[position])
                        .contentShape(Rectangle())
                        .frame(width: tabWidth)
                        .onTapGesture {
                            tabList2.mapData(\.isSelected, false)
                            withAnimation {
                                tabList2[position].isSelected = true
                                scrollProxy.scrollTo(position, anchor: .center)
                            }
                            didSelectTab?(tabList2[position].isSelected)
                        }
                        .id(position)
                }
            }
            Divider()
                .background(Color.accentColor.opacity(0.2))
        }
    }
    
    var TabbarStye3: some View {
        VStack {
            Text("TabbarStye3")
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollProxy in
                    LazyHStack(spacing: 0) {
                        ForEach(tabList3.indices, id: \.self) { position in
                            TabBarCellView3(item: $tabList3[position])
                                .contentShape(Rectangle())
                                .frame(width: tabWidth)
                                .onTapGesture {
                                    tabList3.mapData(\.isSelected, false)
                                    withAnimation {
                                        tabList3[position].isSelected = true
                                        scrollProxy.scrollTo(position, anchor: .center)
                                    }
                                    didSelectTab?(tabList3[position].isSelected)
                                }
                                .id(position)
                        }
                    }
                }
            }
            .background(Color.accentColor.opacity(0.3))
            .cornerRadius(30)
            .frame(height: tabbarHeight)
        }
    }
    
    var TabbarStye4: some View {
        VStack {
            Text("TabbarStye4")
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollProxy in
                    LazyHStack {
                        ForEach(tabList4.indices, id: \.self) { position in
                            TabBarCellView3(item: $tabList4[position])
                                .contentShape(Rectangle())
                                .frame(width: tabWidth)
                                .onTapGesture {
                                    tabList4.mapData(\.isSelected, false)
                                    withAnimation {
                                        tabList4[position].isSelected = true
                                        scrollProxy.scrollTo(position, anchor: .center)
                                    }
                                    didSelectTab?(tabList4[position].isSelected)
                                }
                                .id(position)
                        }
                        .padding(8)
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 30, style: .circular).stroke(lineWidth: 1).foregroundColor(.accentColor))
            .frame(height: tabbarHeight)
        }
    }
    
    var TabbarStye5: some View {
        VStack {
            Text("TabbarStye5")
            HStack{
                ForEach(tabList5.indices, id: \.self){ position in
                    TabBarCellView4(item: $tabList5[position])
                        .onTapGesture {
                            tabList5.mapData(\.isSelected, false)
                            DispatchQueue.main.async {
                                withAnimation {
                                    tabList5[position].isSelected = true
                                }
                            }
                            didSelectTab?(tabList5[position].isSelected)
                        }
                }
            }
            .padding(6)
            .frame(width: UIScreen.main.bounds.width - 50 , height: 51)
            .background(Color.accentColor.opacity(0.2))
            .cornerRadius(35)
            .padding(.horizontal, 26)
        }
    }
    
    @ViewBuilder func container(@ViewBuilder content: @escaping (_ proxy: ScrollViewProxy) -> some View) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollProxy in
                LazyHStack(spacing: 0) {
                    content(scrollProxy)
                }
            }
        }
        .background(backgroundColor)
        .frame(height: tabbarHeight)
    }

    
}
