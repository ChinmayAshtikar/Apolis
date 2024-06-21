//Question 3 : https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json
//title
//created_at
//transcodings
//id, title, height


//
//  VideoViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//


import UIKit

class VideoViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var videoTable: UITableView!
    @IBOutlet weak var loadingVideo: UIActivityIndicatorView!
    
    private var videoViewModel = VideoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTable.dataSource = self
        loadingVideo.hidesWhenStopped = true
        
        videoViewModel.delegate = self
        startLoadingData()
    }
}

// Helper Functions
extension VideoViewController {
    func startLoadingData() {
        loadingVideo.startAnimating()
        videoViewModel.fetchVideos()
    }
}

// UITableViewDataSource
extension VideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = videoViewModel.getTranscodings().count
        print("Number of rows in section: \(count)")
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.videoCell, for: indexPath) as! VideoTableViewCell
        let transcoding = videoViewModel.getTranscodings()[indexPath.row]
        cell.configure(with: transcoding)
        if let videoResponse = videoViewModel.getVideoResponses().first {
            cell.configureVideoDetails(with: videoResponse)
        }
        return cell
    }
}

// VideoDataDelegate
extension VideoViewController: DataPassDelegate {
    func didFetchData() {
        videoTable.reloadData()
        loadingVideo.stopAnimating()
    }
    
    func didNotFetchData(error: Error) {
        loadingVideo.stopAnimating()
        print("\(error.localizedDescription)")
    }
}
