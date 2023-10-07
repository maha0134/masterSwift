//
//  ButtonsView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-07-17.
//

import SwiftUI

struct HomeButton: View {
	@Environment(\.colorScheme) var colorScheme
    var body: some View {
		Label("Back to Home", systemImage: "house.fill")
			.fontWeight(.bold)
			.padding(15)
			.foregroundColor(.pink)
			.background(colorScheme == .dark ? .white : .black)
			.cornerRadius(5)
			.shadow(radius: 5)
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
