//
//  PersistencyManager.swift
//  BlueLibrarySwift
//
//  Created by SDMobile on 4/15/16.
//  Copyright © 2016 Raywenderlich. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {

    private var albums = [Album]()
    
    override init() {
        //Dummy list of albums
        let album1 = Album(title: "Best of Bowie",
            artist: "David Bowie",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_david_bowie_best_of_bowie.png",
            year: "1992")
        
        let album2 = Album(title: "It's My Life",
            artist: "No Doubt",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_david_bowie_best_of_bowie.png",
            year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
            artist: "Sting",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_sting_nothing_like_the_sun.png",
            year: "1999")
        
        let album4 = Album(title: "Staring at the Sun",
            artist: "U2",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_david_bowie_best_of_bowie.png",
            year: "2000")
        
        let album5 = Album(title: "American Pie",
            artist: "Madonna",
            genre: "Pop",
            coverUrl: "https://s3.amazonaws.com/CoverProject/album/album_david_bowie_best_of_bowie.png",
            year: "2000")
        
        albums = [album1, album2, album3, album4, album5]
    }
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func addAlbum(album: Album, index: Int) {
        if (albums.count >= index) {
            albums.insert(album, atIndex: index)
        } else {
            albums.append(album)
        }
    }
    
    func deleteAlbumAtIndex(index: Int) {
        albums.removeAtIndex(index)
    }
    
    func saveImage(image: UIImage, filename: String) {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        let data = UIImagePNGRepresentation(image)!
        data.writeToFile(path, atomically: true)
    }
    
    func getImage(filename: String) -> UIImage? {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        do {
            let data = try NSData(contentsOfFile: path, options: .UncachedRead)
            return UIImage(data: data)
        } catch {
            return nil
        }
        
    }
    
}
