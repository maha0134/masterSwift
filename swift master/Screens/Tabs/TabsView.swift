//
//  TabView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-10-02.
//

import SwiftUI

struct TabsView: View {
	@StateObject private var tabsVM = TabsViewModel()
    var body: some View {
		TabView {
			HomeScreenView(vm: tabsVM)
				.tabItem {
					Label("Home", systemImage: "house")
				}
				.tag(0)
			
			StatsScreenView()
				.tabItem {
					Label("Stats", systemImage: "chart.bar.xaxis")
				}
				.tag(1)
		}
		.tint(.pink)
		.onAppear {
			Task {
				tabsVM.showLoader = true
				await tabsVM.readFromFirebase()
				tabsVM.showLoader = false
			}
		}
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
