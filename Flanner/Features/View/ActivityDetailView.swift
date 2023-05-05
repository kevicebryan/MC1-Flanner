//
//  ActivityDetailView.swift
//  Flanner
//
//  Created by Kevin Bryan on 04/05/23.
//

import SwiftUI

struct ActivityDetailView: View {
  let task: TaskViewModel

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack {
      ZStack {
        Image(task.image)

        VStack {
          Spacer()
          Rectangle().foregroundColor(.white)
            .frame(width: .infinity, height: 300)
            .edgesIgnoringSafeArea(.all)
        }

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
        .cornerRadius(40)
        .overlay(
          VStack(alignment: .leading, spacing: 10) {
            Text(task.name)
              .font(.system(size: 24, weight: .bold))
            HStack {
              ForEach(task.tags) {
                tag in Text("\(tag.emoji ?? "🔘") \(tag.name ?? "Tag")")
                  .font(.system(size: 12, weight: .light))
                  .padding(6)
                  .overlay(
                    RoundedRectangle(cornerRadius: 4)
                      .stroke(Color(hex: tag.color ?? "d9d9d9"), lineWidth: 1.5)
                  )
              }
            }

            ScrollView {
              Text(task.detail)
                .lineSpacing(5)
                .font(.system(size: 14, weight: .regular))
            }.frame(maxHeight: 180)

            HStack {
              Spacer()
              Button {
                // MARK: Make Task as Planned

                task.task.planned = true
                print("SET PLANNED of  \(task.name) to \(task.planned)")
                dismiss()
              }
                label: {
                CustomButton(label: "Wishlist", width: 250)
              }
              Spacer()
            }
            .frame(height: 32)
            .padding(.top, 16)
            .padding(.bottom, -12)
            .background(.white)
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
            dismiss()
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

struct ActivityDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityDetailView(task: TaskListViewModel().tasks[0])
  }
}
