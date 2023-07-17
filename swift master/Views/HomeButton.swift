//
//  ButtonsView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-07-17.
//

import SwiftUI

struct HomeButton: View {
    var body: some View {
		Label("Back to Home", systemImage: "house.fill")
			.padding(15)
			.border(.black)
			.foregroundColor(.white)
			.background(.black)
			.cornerRadius(5)
			.shadow(radius: 5)
			.padding(.top, 25)
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
