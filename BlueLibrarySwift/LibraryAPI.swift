//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by SDMobile on 4/14/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    class var sharedInstance: LibraryAPI {
        struct Singleton {
            static let instance = LibraryAPI()
        }
        return Singleton.instance
    }
    
    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    private let isOnline: Bool
    
    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false
        
        super.init()
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(album: Album, index: Int) {
        persistencyManager.addAlbum(album, index: index)
        if isOnline {
            httpClient.postRequest("api/addAlbum", body: album.description)
        }
    }
    
    func deleteAlbum(index: Int) {
        persistencyManager.deleteAlbumAtIndex(index)
        if isOnline {
            httpClient.postRequest("api/deleteAlbum", body: "\(index)")
        }
    }
    
}
