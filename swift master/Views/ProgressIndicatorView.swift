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
			Text("Loading...")
				.padding()
		}
		
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
		ProgressIndicatorView()
    }
}
