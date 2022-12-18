# OneTweet
A Twitter timeline example


## Overview

This project is build in SwiftUI, it shows a Timeline of tweets and a when you click on 
a tweet you are directed to a detail screen that shows the tweet and replies of the tweet. 


## What is featured

- The project follows the MVVM pattern.
- It is separated into 4 layers:
    - The APIClient layer for where we fetch data of the timeline
    - The Data layer that uses a repository to get the data from APIClient or any other data sources
    - The Domain layer that has the entities for Timeline and Tweets.
    - The presentation layer which has the viewModel and Views of the timeline and tweet feeds.
- It has error handling where the app will show an alert if there is an issue getting the timeline feed.
- Unit tests, there are unit tests for APIClient, Repository, DateFormatter, and ViewModel.
- The UI/UX closely resembles Twitter current UI/UX.
- For images, AsyncImage is used to fetch images with url
- Using async/await to fetch timeline tweets and @MainActor to return timeline in the main thread

