//
//  PostsCoreDataModel.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import CoreData

public struct PostsCoreDataModel  {
    
    let username : String
    let ownerImage : String
    let ownerJobTitle: String
    let image : String
    let likes: Int
    let comments : Int
    let isBookmarked: Bool
    let caption: String
    let dateTime : String
    
    init(username: String, ownerImage: String, ownerJobTitle: String, image: String, likes: Int, comments: Int, isBookmarked: Bool, caption: String, dateTime: String) {
        self.username = username
        self.ownerImage = ownerImage
        self.ownerJobTitle = ownerJobTitle
        self.image = image
        self.likes = likes
        self.comments = comments
        self.isBookmarked = isBookmarked
        self.caption = caption
        self.dateTime = dateTime
    }
    
    init(post: Posts) {
        self.username = post.username!
        self.ownerImage = post.ownerImage!
        self.ownerJobTitle = post.ownerJobTitle!
        self.image = post.image!
        self.likes = Int(post.likes)
        self.comments = Int(post.comments)
        self.isBookmarked = post.isBookmarked
        self.caption = post.caption!
        self.dateTime = post.dateTime!
    }
    /*
    init(post: Post) {
        self.username = post.username
        self.ownerImage = post.ownerImage
        self.ownerJobTitle = post.ownerJobTitle
        self.image = post.image
        self.likes = Int(post.likes)
        self.comments = Int(post.comments)
        self.isBookmarked = post.isBookmarked
        self.caption = post.caption
        self.dateTime = post.dateTime
    }
     */

    init(post: LikedPosts) {
        self.username = post.username!
        self.ownerImage = post.ownerImage!
        self.ownerJobTitle = post.ownerJobTitle!
        self.image = post.image!
        self.likes = Int(post.likes)
        self.comments = Int(post.comments)
        self.isBookmarked = post.isBookmarked
        self.caption = post.caption!
        self.dateTime = post.dateTime!
    }
}

public extension PostsCoreDataModel {
    
    static func makePosts() -> [PostsCoreDataModel] {
        return CoreDataSevice().fetchPosts()
    }
    
    static func savePosts(posts: [PostsCoreDataModel]) {
        return CoreDataSevice().savePosts(posts: posts)
    }
    
}
