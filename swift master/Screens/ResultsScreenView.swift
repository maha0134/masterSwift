//
//  ResultsScreenView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-07-09.
//

import SwiftUI

struct ResultsScreenView: View {
	@ObservedObject var vm: HomeScreenViewModel
    var body: some View {
		VStack {
			Text("Results")
				.font(.headline)
				.padding()
			
			Text("You've got \(vm.score) out of \(vm.questions.count) questions right")
			
			Spacer()
			
			Button {
				vm.resultsPresented = false
			} label: {
				Text("Back to home")
			}

		}
		
    }
}

struct ResultsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreenView(vm: HomeScreenViewModel())
    }
}
