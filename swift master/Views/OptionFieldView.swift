//
//  OptionFieldView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct OptionFieldView: View {
	var option: String
	@Binding var selectedOption: String
	var selected: Bool { selectedOption == option	}
	var body: some View {
		HStack {
			Image(systemName: selected ? "circle.inset.filled" : "circle")
			Text(option)
			Spacer()
		}
		.padding()
		.border(.gray, width: 0.25)
		.background()
		.onTapGesture {
			selectedOption = option
		}
	}
}

struct OptionFieldView_Previews: PreviewProvider {
	static var previews: some View {
		OptionFieldView(option: "test", selectedOption: .constant("test"))
	}
}
