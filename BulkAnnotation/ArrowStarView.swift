//
//  ArrowStarView.swift
//
//  Created by Jim Termini on 11/26/23.
//  Copyright © 2023 Anal Retentive Apps, Inc. All rights reserved.
//

import SwiftUI

struct ArrowStarView: View {
   
   var body: some View {
      VStack(spacing: 0) {
         Image(systemName: "line.diagonal.arrow")
            .foregroundStyle(.red)
            .font(.system(size: 40, weight: .medium))
            .padding(.leading, 20)
         Image(systemName: "star.fill")
            .symbolRenderingMode(.palette)
            .foregroundStyle(.red)
            .font(.system(size: 30, weight: .regular))
            .padding(.top, -13)
            .padding(.trailing, 24)
      }
      .rotationEffect(.degrees(45))
   }
}

struct BallView: View {
   var body: some View {
      Text("⇡")
         .symbolRenderingMode(.palette)
         .foregroundStyle(.blue, .green)
         .font(.system(size: 30, weight: .regular))
   }
}

#Preview {
   VStack {
      ArrowStarView()
      BallView()
   }
}
