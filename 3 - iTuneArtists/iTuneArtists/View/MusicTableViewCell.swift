//
//  MusicTableViewCell.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPriceLabel()
        setupSeparator()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with artist: Artist) {
        nameLabel.text = artist.artistName
        detailLabel.text = "\(artist.country) - \(artist.primaryGenreName)"
        priceLabel.text = "$\(artist.collectionPrice)"
        if let imageUrl = artist.artworkUrl100 {
            NetworkAPIManager.shared.fetchImage(urlString: imageUrl) { data in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self.musicImage.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func setupPriceLabel(){
        priceLabel.layer.borderColor = UIColor.blue.cgColor
        priceLabel.layer.borderWidth = 1.0
        priceLabel.layer.cornerRadius = 5.0
        priceLabel.layer.masksToBounds = true
        
    }
    
    func setupSeparator(){
        let separator = UIView(frame: CGRect(x: 15, y: self.frame.size.height - 0.5, width: self.frame.size.width - 30, height: 0.5))
        separator.backgroundColor = UIColor.lightGray
        separator.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        self.addSubview(separator)
    }
    
}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArtistCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTable.musicTableCellIdentifer.rawValue, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        let artist = viewModel.getArtist(at: indexPath.row)
        cell.configure(with: artist)
        return cell
    }
}
