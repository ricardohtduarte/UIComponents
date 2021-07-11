//
//  ContentView.swift
//  MiniPlayerTransitionSwiftUI
//
//  Created by Ricardo Duarte on 11/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AppleMusicAnimation()
    }
}

struct AppleMusicAnimation: View {
    @State var show = false
    @Namespace var namespace

    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 15) {
                HStack (spacing: 15) {

                    Image(uiImage: UIImage(named: "darkside.jpg")!).resizable().aspectRatio(contentMode: .fit).frame(width: self.show ? 350 : 50, height: self.show ? 350 : 50).padding(.top, self.show ? 40 : 0)

                    if !self.show {
                        MiniPlayer(namespace: _namespace)
                    }
                }

                if self.show {
                    MaxPlayer(namespace: _namespace)
                }


            }
            .padding(.all).background(Color.white.shadow(radius: 3))
            .onTapGesture {
                withAnimation(Animation.easeOut(duration: 0.2)) {
                    show.toggle()
                }
            }
        }.background(Color.black.opacity(0.05)).edgesIgnoringSafeArea(.all)
    }
}

struct MaxPlayer: View {
    @Namespace var namespace

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Title").font(.title).fontWeight(.semibold)
                    Text("Artist").font(.headline).foregroundColor(Color(UIColor.systemBlue))
                }.matchedGeometryEffect(id: "Title", in: self.namespace)
                Spacer()
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "play.fill").font(.title).foregroundColor(.black)
            }.matchedGeometryEffect(id: "Play", in: self.namespace)

            Spacer()
        }
    }
}

struct MiniPlayer: View {
    @Namespace var namespace

    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("Title")
        }.matchedGeometryEffect(id: "Title", in: self.namespace)

        Spacer()

        Button(action: {}) {
            Image(systemName: "play.fill").font(.title).foregroundColor(.black)
        }.matchedGeometryEffect(id: "Play", in: self.namespace)

        Button(action: {}) {
            Image(systemName: "forward.fill").font(.title).foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
