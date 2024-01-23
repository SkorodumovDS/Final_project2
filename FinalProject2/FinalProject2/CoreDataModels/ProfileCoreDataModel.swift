//
//  ProfileCoreDataModel.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import CoreData

public struct ProfileCoreDataModel {
    
    let username : String
    let name : String
    let ownerImage : String
    let ownerJobTitle: String
    let publishing : Int
    let followers: Int
    let follow : Int
    let photos : [PhotosCoreDataModel]
    let likedPosts: [PostsCoreDataModel]
    
    init(username: String, name: String, ownerImage: String, ownerJobTitle: String, publishing: Int, followers: Int, follow: Int, photos: [PhotosCoreDataModel] , likedposts: [PostsCoreDataModel]) {
        self.username = username
        self.name = name
        self.ownerImage = ownerImage
        self.ownerJobTitle = ownerJobTitle
        self.publishing = publishing
        self.followers = followers
        self.follow = follow
        self.photos = photos
        self.likedPosts = likedposts
    }
    
    /*
    init(profileModel: ProfileModel) {
        self.username = profileModel.username
        self.name = profileModel.name
        self.ownerImage = profileModel.ownerImage
        self.ownerJobTitle = profileModel.ownerJobTitle
        self.publishing = profileModel.publishing
        self.followers = profileModel.followers
        self.follow = profileModel.follow
        
        let photosModels : [PhotosModel] = profileModel.photos
        let photoModels =  photosModels.map{
            _element in
            PhotosCoreDataModel(title: _element.title)
        }
        self.photos = photoModels
       
        let likedPostsModel : [Post] = profileModel.likedPosts
        let likedpostModel =  likedPostsModel.map{
            _element in
            PostsCoreDataModel(post: _element)
        }
        self.likedPosts = likedpostModel
    }
    */
    init(profile: Profile) {
        self.username = profile.username!
        self.name = profile.name!
        self.ownerImage = profile.ownerImage!
        self.ownerJobTitle = profile.ownerJobTitle!
        self.publishing = Int(profile.publishing)
        self.followers = Int(profile.followers)
        self.follow = Int(profile.follow)
       
        let photosModels : [Photos] = profile.photos! as! [Photos]
        let photoModels =  photosModels.map{
            _element in
            PhotosCoreDataModel(title: _element.title!)
        }
        self.photos = photoModels
        
        let likedPostsModel : [Posts] = profile.posts?.allObjects as! [Posts]
        let likedpostModel =  likedPostsModel.map{
            _element in
            PostsCoreDataModel(post: _element)
        }
        self.likedPosts = likedpostModel
    }
}

public extension ProfileCoreDataModel {
    
    static func save(profile: ProfileCoreDataModel) {
        CoreDataSevice().save(profile: profile)
    }
    
}

