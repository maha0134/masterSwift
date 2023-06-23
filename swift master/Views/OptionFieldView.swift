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
	
	var body: some View {
		HStack {
				Image(systemName: "circle")
				.background(Color.white)
				
				Text(option)
				Spacer()
			}
		.padding()
		.background(Color.gray)
    }
}

struct OptionFieldView_Previews: PreviewProvider {
    static var previews: some View {
		OptionFieldView(option: "test", selectedOption: .constant("test"))
    }
}
