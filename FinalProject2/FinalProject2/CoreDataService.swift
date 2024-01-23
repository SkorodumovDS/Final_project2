//
//  CoreDataService.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import CoreData

protocol ICoreDataService {
    func makeEmptyProfile(phone: String) -> LoginCoreDataModel
    func fetchPhotos() -> [PhotosCoreDataModel]
    func save(profile: ProfileCoreDataModel)
    func search(loginModel: LoginCoreDataModel) -> LoginCoreDataModel
    func fetchPosts() -> [PostsCoreDataModel]
    func savePosts(posts: [PostsCoreDataModel])
    
}

final class CoreDataSevice {
    
    private let modelName: String
    private let objectModel: NSManagedObjectModel
    private let storageCoordinator : NSPersistentStoreCoordinator
   
    lazy var mainContext :NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = storageCoordinator
        return context
    }()
    
    lazy var backgroundContext : NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = storageCoordinator
        return context
    }()
    
    init() {
        guard let url = Bundle.main.url(forResource: "ProjectData", withExtension: "momd")
        else {fatalError()}
        
        let path = url.pathExtension
        let name = url.lastPathComponent
        modelName = name
        
        guard let model = NSManagedObjectModel(contentsOf: url) else {fatalError()}
        objectModel = model
        
        storageCoordinator = NSPersistentStoreCoordinator(managedObjectModel: objectModel)
        
        let storename = name + "sqllite"
        let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let persistantStoreUrl = documentDirectoryUrl?.appendingPathComponent(storename)
        
        guard let persistantStoreUrl else {return}
        
        do {
            try storageCoordinator.addPersistentStore(type: .sqlite, at: persistantStoreUrl)
        } catch {fatalError()}
        
    }
}

extension CoreDataSevice: ICoreDataService {
    
    func fetchPhotos() -> [PhotosCoreDataModel] {
        
        let fetchRequest: NSFetchRequest<Photos> = Photos.fetchRequest()
        
        do {
            
            let photosModels: [Photos] = try mainContext.fetch(fetchRequest)
            let photoModels =  photosModels.map{
                _element in
                PhotosCoreDataModel(title: _element.title!)
            }
            return Array(photoModels)
        } catch {
            return []
        }
    }
    
    func fetchPosts() -> [PostsCoreDataModel] {
        
        let fetchRequest: NSFetchRequest<Posts> = Posts.fetchRequest()
        
        do {
            
            let postsArray: [Posts] = try mainContext.fetch(fetchRequest)
            let postsModelArray =  postsArray.map{
                _element in
                PostsCoreDataModel(post: _element)
            }
            return Array(postsModelArray)
        } catch {
            return []
        }
    }
    
    func save(profile: ProfileCoreDataModel) {
        
        backgroundContext.perform {
            let savedProfile = Profile(context: self.backgroundContext)
            savedProfile.username = profile.username
            savedProfile.name = profile.name
            savedProfile.ownerImage = profile.ownerImage
            savedProfile.ownerJobTitle = profile.ownerJobTitle
            savedProfile.publishing = Int32(profile.publishing)
            savedProfile.followers = Int32(profile.followers)
            savedProfile.follow = Int32(profile.follow)
            savedProfile.photos = NSSet(array: profile.photos)
            savedProfile.posts = NSSet(array: profile.likedPosts)
            //сохраняем изменения
            do {
                try self.backgroundContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
       
    }
    
    func savePosts(posts: [PostsCoreDataModel]) {
        posts.forEach() { post in
            backgroundContext.perform {
                let savedPost = Posts(context: self.backgroundContext)
                savedPost.username = post.username
                savedPost.ownerImage = post.ownerImage
                savedPost.ownerJobTitle = post.ownerJobTitle
                savedPost.image = post.image
                savedPost.likes = Int32(post.likes)
                savedPost.comments = Int32(post.comments)
                savedPost.isBookmarked = post.isBookmarked
                savedPost.caption = post.caption
                savedPost.dateTime = post.dateTime
                //сохраняем изменения
                do {
                    try self.backgroundContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func search(loginModel: LoginCoreDataModel) -> LoginCoreDataModel {
       
        let fetchRequest: NSFetchRequest<LoginModelData> = LoginModelData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "phone== %@", loginModel.phone)
        do {

            let loginModels: [LoginModelData] = try mainContext.fetch(fetchRequest)
            if loginModels.isEmpty{ return loginModel}
            else {
                let firstLogin = loginModels.first!
                let firstProfile = firstLogin.username!
                return LoginCoreDataModel(phone: firstLogin.phone!, username: ProfileCoreDataModel(profile: firstProfile))
            }
        } catch {
            return loginModel
        }
    }
    
    func makeEmptyProfile(phone:String) -> LoginCoreDataModel {
        
        let emptyProfile = Profile(context: self.backgroundContext)
        emptyProfile.username = phone
        emptyProfile.name = ""
        emptyProfile.ownerImage = ""
        emptyProfile.ownerJobTitle = ""
        emptyProfile.publishing = 0
        emptyProfile.followers = 0
        emptyProfile.follow = 0
        emptyProfile.photos = []
        emptyProfile.posts = []
        //сохраняем изменения
        do {
            try self.backgroundContext.save()
        } catch {
            print(error.localizedDescription)
        }
    let emptyProfileData = ProfileCoreDataModel(profile: emptyProfile)
    return LoginCoreDataModel(phone: phone, username: emptyProfileData)
    }
    
}


