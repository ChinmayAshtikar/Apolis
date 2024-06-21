//
//  VideoTableViewCell.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var transcodingTitleLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with transcoding: Transcoding) {
        transcodingTitleLabel.text = transcoding.title
        heightLabel.text = "\(transcoding.height)"
    }
    
    func configureVideoDetails(with video: VideoResponse) {
        titleLabel.text = video.title
        createdLabel.text = video.created_at
    }
    
    //        private func formatDateString(_ dateString: String) -> String? {
    //            let dateFormatter = DateFormatter()
    //            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    //            guard let date = dateFormatter.date(from: dateString) else { return nil }
    //            dateFormatter.dateStyle = .medium
    //            dateFormatter.timeStyle = .short
    //            return dateFormatter.string(from: date)
    //        }
}

