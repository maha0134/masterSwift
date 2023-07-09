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
		ScrollView {
			Text("Results")
				.font(.headline)
				.padding()
			
			Text("You've got \(vm.score) out of \(vm.questions.count) questions right")
				.padding()
			
			Text("Here are the correct answers")
				.padding(.bottom, 10)
			
			ForEach(vm.questions) { question in
				VStack(alignment: .leading, spacing: 10) {
					Text("Q: " + question.question)
					HStack {
						Text("Answer:")
						Text(question.choices[question.correctChoice])
							.fontWeight(.bold)
							.foregroundColor(.mint)
					}
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding([.leading, .trailing, .bottom], 15)
				
			}
			
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
