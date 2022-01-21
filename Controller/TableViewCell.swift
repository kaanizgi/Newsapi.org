//
//  TableViewCell.swift
//  NewsApi.org
//
//  Created by Kaan İzgi on 20.01.2022.
//

import UIKit

protocol saveButtonPath {
    func ButtonPath(indexPath:IndexPath)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var timesago: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var imageUrl: UIImageView!
    var hucreProtocol:saveButtonPath?
    var indexPath:IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        var hucreProtocol:saveButtonPath?
        var indexPath:IndexPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func saveNews(_ sender: Any) {
        hucreProtocol?.ButtonPath(indexPath:indexPath!)
    }
}
