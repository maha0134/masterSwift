//
//  StatsView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-10-02.
//

import SwiftUI
import Charts

struct StatsScreenView: View {
	private let scores = UserDefaultsViewModel().fetchStorageValues()
    var body: some View {
        VStack {
        	Text("Check out your past scores")
			Chart(scores, id: \.id) { score in
					LineMark(
						x: .value("Attempt", score.id),
						y: .value("Score", score.score)
					)
			}
			
        }
			.navigationTitle("Stats")
		
    }
}

struct StatsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StatsScreenView()
    }
}
