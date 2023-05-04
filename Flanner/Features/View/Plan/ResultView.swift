//
//  ResultView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 04/05/23.
//

import SwiftUI

struct ResultView: View {
  @Binding var showView: Bool
  @Binding var isAnswering: Bool
  @State var currIdx = 0

  let plans: [TaskViewModel]

  init(showView: Binding<Bool>, isAnswering: Binding<Bool>, plans: [TaskViewModel]) {
    self._showView = showView
    self._isAnswering = isAnswering
    self.plans = plans
  }

  var body: some View {
    NavigationView {
      VStack {
        ZStack {
          Image(plans[currIdx].image)
          VStack(spacing: 0) {
            Color.black.opacity(0.6)
              .frame(height: 90, alignment: .top).padding(0)
            LinearGradient(
              colors: [.black.opacity(0.6), .black.opacity(0)], startPoint: .topLeading, endPoint: .bottomLeading
            )
            .frame(height: 50, alignment: .top)
            Spacer()
          }

        }.ignoresSafeArea()
          .frame(height: 300)

        Spacer()
        Rectangle()
          .foregroundColor(.white)
          .cornerRadius(40).overlay(
            VStack(alignment: .leading, spacing: 10) {
              Text(plans[currIdx].name)
                .font(.system(size: 24, weight: .bold))
              HStack {
                ForEach(plans[currIdx].tags) {
                  tag in Text("\(tag.emoji ?? "🔘") \(tag.name ?? "Tag")")
                    .font(.system(size: 12, weight: .light))
                    .padding(6)
                    .overlay(
                      RoundedRectangle(cornerRadius: 4)
                        .stroke(.blue, lineWidth: 1.5)
                    )
                }
              }

              ScrollView {
                Text(plans[currIdx].detail)
                  .lineSpacing(5)
                  .font(.system(size: 14, weight: .regular))
                  .offset(y: 10)
              }.frame(maxHeight: 300)

              HStack {
                Button {
                  // MARK: Shuffle

                  if currIdx == (plans.count - 1) {
                    currIdx = 0
                  } else {
                    currIdx += 1
                  }
                }
              label: {
                  Image(systemName: "repeat")
                    .foregroundColor(Colors.orange)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                      RoundedRectangle(cornerRadius: 20)
                        .stroke(Colors.orange, lineWidth: 5)
                    )
                }
                .cornerRadius(20)
                .frame(width: 50, height: 48)

                Button {
                  // MARK: Make Task as Planned

                  plans[currIdx].task.planned = true
                  print("SET PLANNED of  \(plans[currIdx].name) to \(plans[currIdx].planned)")
                  isAnswering.toggle()
                  showView.toggle()
                }
              label: {
                  CustomButton(label: "Wishlist", width: 250)
                }
                Spacer()
              }.frame(height: 32).padding(.top, 12).padding(.bottom, -20)
            }
            .padding(EdgeInsets(top: 30, leading: 25, bottom: 30, trailing: 25))
          )
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        // MARK: CLOSE BUTTON

        ToolbarItem(placement: .principal) {
          HStack {
            Button {
              isAnswering.toggle()
              showView.toggle()
            } label: {
              Image(systemName: "xmark")
                .offset(y: 5)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(Colors.creamTint)
                .ignoresSafeArea()
            }
            Spacer()
          }
        }
      }
    }
  }
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    ResultView(showView: .constant(true), isAnswering: .constant(true), plans: TaskListViewModel().tasks)
  }
}
