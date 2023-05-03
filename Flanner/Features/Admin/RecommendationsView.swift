//
//  RecommendationsView.swift
//  Flanner
//
//  Created by Kevin Bryan on 03/05/23.
//

import SwiftUI

struct RecommendationsView: View {
  let tlvm = TaskListViewModel()
  var body: some View {
    Text("Recs")
    Button {
      tlvm.getRecommendations()
    } label: {
      Text("Get Recommenations")
    }

    ForEach(tlvm.recommendations, id: \.self.id) { task in
      AdminTaskCard(task: task)
    }
  }
}

struct RecommendationsView_Previews: PreviewProvider {
  static var previews: some View {
    RecommendationsView()
  }
}
