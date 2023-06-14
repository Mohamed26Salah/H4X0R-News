//
//  ContentView.swift
//  H4X0R News
//
//  Created by Mohamed Salah on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networManager = NetworkManager()
    var body: some View {
        NavigationView{
            //whenever posts changes it is going to trigger a rebuild of our list
            List(networManager.posts){post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            
            }
            .navigationBarTitle(Text("H4X0R News"))
        }
        .onAppear {
            self.networManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//let posts=[
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Halala"),
//    Post(id: "3", title: "Ya Zmeely")
//]

