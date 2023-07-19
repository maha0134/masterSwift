//
//  ProgressView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-07-17.
//

import SwiftUI

struct ProgressIndicatorView: View {
	var body: some View {
		VStack {
			ProgressView()
				.tint(.white)
			
			Text("Loading...")
				.padding()
		}
		.font(.title2)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color(hue: 0, saturation: 0, brightness: 0, opacity: 0.9))
		.foregroundColor(.white)
	}
}

struct ProgressIndicatorView_Previews: PreviewProvider {
	static var previews: some View {
		ProgressIndicatorView()
	}
}
