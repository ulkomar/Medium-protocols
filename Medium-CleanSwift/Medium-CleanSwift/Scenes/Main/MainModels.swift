import UIKit

enum Main {
    // MARK: Use cases
    
    enum displayCartoonCharacters {
        struct Request {
        }
        struct Response {
            let characters: [CharResult]
        }
        struct ViewModel {
            struct characterInformationModel {
                let id: Int
                let name: String
                let species: String
            }
            var characterInformation: [characterInformationModel]
        }
    }
}
