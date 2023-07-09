//
//  ContentView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct HomeScreenView: View {
	@StateObject var vm = HomeScreenViewModel()
	
	var body: some View {
		
		NavigationStack {
			Text("Swift Master")
				.font(.title)
			
			Text("Welcome to Swift Master, your one stop destinaton for iOS preparation and landing your next iOS role!")
				.padding()
			
			Text("Choose a difficulty level: ")
				.padding(.top, 25)
			//TODO: Select based on difficulty and randomize
			Picker("Level", selection: $vm.difficulty) {
				Text("Easy").tag(0)
				Text("Medium").tag(1)
				Text("Expert").tag(2)
				Text("Random").tag(3)
			}
			.padding()
			.pickerStyle(.segmented)
			
			Button {
				print("button clicked!")
				generateQuiz()
			} label: {
				Text("Begin Quiz")
			}
			.padding(10)
			.background(Color.pink)
			.foregroundColor(.black)
			.cornerRadius(5)
			.shadow(radius: 2)
			.padding(.top, 30)
			
			.navigationDestination(isPresented: $vm.showQuiz) {
				//TODO: Send Vm instead
				QuestionScreenView(questions: vm.questions, questionNumber: vm.currentQuestionNumber, selectedOption: $vm.selectedOption, cancellationRequested: $vm.cancellationRequested)
					.navigationBarBackButtonHidden(true)
					.toolbar {
						ToolbarItem(placement: .bottomBar) {
							HStack {
								Button("Cancel Quiz") {
									vm.cancellationRequested = true
									clearStates()
								}
								
								Spacer()
								Button {
									vm.isAlertActive = true
									checkCorrectAnswer()
								} label: {
									if vm.currentQuestionNumber == vm.questions.count - 1 {
										Text("Finish")
									} else {
										Text("Next")
									}
								}
								.padding(7)
								.background(Color.pink)
								.foregroundColor(.black)
								.cornerRadius(5)
								.shadow(radius: 2)
							}
						}
					}
			}
		}
		
		.alert(Text(vm.correctAnswerSelected ? "Bravo!" : "Oops!"), isPresented: $vm.isAlertActive, actions: {
			Button(role: .none) {
				if vm.currentQuestionNumber == vm.questions.count - 1 {
					vm.showQuiz = false
					vm.resultsPresented = true
				} else {
					vm.currentQuestionNumber += 1
				}
				vm.correctAnswerSelected = false
				vm.currentCorrectAnswer = ""
			} label: {
				Text("OK")
			}
		}, message: {
			if vm.correctAnswerSelected {
				Text("Your choice is correct")
			} else {
				Text("The right answer was: \(vm.currentCorrectAnswer)")
			}
		})
		.padding()
		.fullScreenCover(isPresented: $vm.resultsPresented) {
			ResultsScreenView(vm: vm)
		}
	}
}

struct HomeScreenView_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreenView()
	}
}

extension HomeScreenView {
	
	func generateQuiz() {
		clearStates()
		//Pull out questions from the questionbank having the desired difficulty
		vm.questions = vm.allQuestions.filter({ $0.difficulty == vm.difficulty })
		vm.showQuiz = true
	}
	
	//Clear everything about previous attempts
	func clearStates() {
		vm.score = 0
		vm.currentQuestionNumber = 0
		vm.correctAnswerSelected = false
		vm.currentCorrectAnswer = ""
		vm.selectedOption = ""
	}
	
	func checkCorrectAnswer() {
		
		let currentQuestion = vm.questions[vm.currentQuestionNumber]
		let correctAnswer = currentQuestion.choices[currentQuestion.correctChoice]
		if correctAnswer == vm.selectedOption {
			vm.correctAnswerSelected = true
			vm.score += 1
		} else {
			vm.correctAnswerSelected = false
		}
		vm.currentCorrectAnswer = correctAnswer
	}
	
	
}
