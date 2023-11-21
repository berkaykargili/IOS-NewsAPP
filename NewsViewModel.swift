//
//  NewsViewModel.swift
//  NewsProject
//
//  Created by Berkay Kargılı on 19.11.2023.
//

import Foundation

struct NewsTableViewModel {
    let newsList : [News]
    
   
}

extension NewsTableViewModel {
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
    
    
}

struct NewsViewModel {
    let news : News
    
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
}
