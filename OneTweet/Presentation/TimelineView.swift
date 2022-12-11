import SwiftUI

struct TimelineView: View {
    @StateObject var viewModel: TimelineViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.tweets) { tweet in
                ZStack {
                    NavigationLink(value: tweet) {
                        EmptyView()
                    }
                    .opacity(0)
                    FeedView(tweet: tweet)
                }
                .listRowInsets(
                    EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                )
                .listRowSeparator(.visible)
            }
            .buttonStyle(PlainButtonStyle())
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Tweet.self) { tweet in
                TweetDetails(tweet: tweet)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Button(action: {}) {
                        Image(Assets.Image.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 34, height: 34)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getTweets()
        }
        .alert(
            Text("error_alert_title"),
            isPresented: Binding(
                get: {
                    viewModel.showErrorMessage
                }, set: { _,_ in }
            )
        ) {
            Button(action: {
                viewModel.dismissMessage()
            }, label: {
                Text("error_alert_cta")
            })
        } message: {
            Text("error_alert_message")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(viewModel: .init())
    }
}

struct TweetDetails: View {
    @State var tweet: Tweet

    var body: some View {
        List {
            TweetView(tweet: tweet)
                .listRowSeparator(.hidden)
            ForEach(tweet.replies, id: \.id) { value in
                FeedView(tweet: value, replyTo: tweet)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .listStyle(PlainListStyle())
        .navigationTitle("tweet_details__screen_title")
    }
}
