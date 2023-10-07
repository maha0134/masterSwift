//
//  BeginQuizButton.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-07-18.
//

import SwiftUI

struct BeginQuizButton: View {
	var body: some View {
		Text("Begin Quiz")
			.padding(15)
			.background(Color.pink)
			.foregroundColor(.black)
			.cornerRadius(5)
			.shadow(radius: 2)
			.padding(.top, 30)
	}
}

struct BeginQuizButton_Previews: PreviewProvider {
	static var previews: some View {
		BeginQuizButton()
	}
}
