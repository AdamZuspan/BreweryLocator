

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    
    
    var mainlbl1:String!
    var mainlbl2:String!
    var mainlbl3:String!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.img.image = UIImage(named: "dividerBar")
        lbl1.text = mainlbl1
        lbl2.text = mainlbl2
        lbl3.text = mainlbl3

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
