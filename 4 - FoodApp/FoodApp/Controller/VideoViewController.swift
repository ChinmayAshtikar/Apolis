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
    private var transcodings = [Transcoding]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTable.dataSource = self
        loadingVideo.hidesWhenStopped = true
        
        videoViewModel.delegate = self
        
        let useMockData = UserDefaults.standard.bool(forKey: "useMockData")
        videoViewModel.useMockData = useMockData
        
        startLoadingData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let useMockData = UserDefaults.standard.bool(forKey: "useMockData")
        videoViewModel.useMockData = useMockData
        startLoadingData()
    }
    
    func didChangeNetworkSetting(useMockData: Bool) {
        videoViewModel.useMockData = useMockData
        UserDefaults.standard.set(useMockData, forKey: "useMockData")
        startLoadingData()
    }
}

// Helper Functions
extension VideoViewController {
    func startLoadingData() {
        loadingVideo.startAnimating()
        Task {
            do {
                if let fetchedVideos = try await videoViewModel.fetchVideos() {
                    self.transcodings = videoViewModel.getTranscodings()
                    videoTable.reloadData()
                }
                loadingVideo.stopAnimating()
            } catch {
                loadingVideo.stopAnimating()
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

// UITableViewDataSource
extension VideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoViewModel.getTranscodings().count
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

// DataPassDelegate
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

extension VideoViewController: SettingsDelegate {}
