//
//  StatsView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-10-02.
//

import SwiftUI
import Charts

struct StatsScreenView: View {
	@State private var scores = [ScoreData]()
	var body: some View {
		VStack {
			if !scores.isEmpty {
				Text("Check out your past scores")
				Chart(scores, id: \.id) { score in
					LineMark(
						x: .value("Attempt", score.difficulty),
						y: .value("Score", score.score)
					)
				}
				.frame(width: 300, height: 200)
			} else {
				VStack {
					Text("Oops!")
						.font(.title)
						.fontWeight(.bold)
						.padding(.bottom, 15)
					
					Text("Looks like there are no stats to show.")
					Text("Please attempt a few quizzes to see stats.")
				}
			}
		}
		.navigationTitle("Stats")
		.onAppear {
			scores = UserDefaultsViewModel().fetchStorageValues()
		}
	}
}

struct StatsScreenView_Previews: PreviewProvider {
	static var previews: some View {
		StatsScreenView()
	}
}
