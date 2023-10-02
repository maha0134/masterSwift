//
//  OptionView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct OptionView: View {
	var options: [String]
	var correctOption: Int
	@Binding var selectedOption: String
	
	var body: some View {
		VStack(alignment: .leading) {
			ForEach(options, id: \.self) { option in
				OptionFieldView(option: option, selectedOption: $selectedOption)
			}
		}
	}
}

struct OptionView_Previews: PreviewProvider {
	static var previews: some View {
		OptionView(options: TabsViewModel().questions[0].choices, correctOption: 0, selectedOption: .constant("let"))
	}
}
