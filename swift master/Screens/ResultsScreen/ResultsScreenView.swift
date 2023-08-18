//
//  ResultsScreenView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-07-09.
//

import SwiftUI

struct ResultsScreenView: View {
	@ObservedObject var vm: HomeScreenViewModel
	@State var answersVisible: Bool = false
	@State var buttonLabel: String = "See all answers"

	var body: some View {
		ScrollView {
			Text("Results")
				.font(.title)
				.padding()
			
			Text("Score: " + String(format: "%.1f", (Float(vm.score) / Float(vm.questions.count) * 100)) + "%")
				.font(.title2)
				.padding(.bottom, 5)
			
			Text("You've got \(vm.score) out of \(vm.questions.count) questions right")
			
			Button {
				withAnimation {
					answersVisible.toggle()
					if buttonLabel == "See all answers" {
						buttonLabel = "Hide answers"
					} else {
						buttonLabel = "See all answers"
					}
				}
			} label: {
				HStack {
					Text(buttonLabel)
						.animation(nil)
						.foregroundColor(.pink)
						.fontWeight(.bold)
					Label("Answers", systemImage: "chevron.forward.circle.fill")
						.labelStyle(.iconOnly)
						.foregroundColor(.pink)
						.font(.title2)
						.rotationEffect(.degrees(answersVisible ? 90 : 0))
				}
			}
			.padding()
			
			if answersVisible {
				ForEach(vm.questions) { question in
					VStack(alignment: .leading, spacing: 10) {
						Text("Q: " + question.question)
						HStack(alignment: .top) {
							Text("Answer:")
							Text(question.choices[question.correctChoice])
								.fontWeight(.bold)
								.foregroundColor(.mint)
						}
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.leading, .trailing, .bottom], 10)
					
				}
			}
		}
		.safeAreaInset(edge: .bottom) {
			Button {
				vm.resultsPresented = false
			} label: {
				HomeButton()
			}
		}
	}
}

struct ResultsScreenView_Previews: PreviewProvider {
	static var previews: some View {
		ResultsScreenView(vm: HomeScreenViewModel())
	}
}
