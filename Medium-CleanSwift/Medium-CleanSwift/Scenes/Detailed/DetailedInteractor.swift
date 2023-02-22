import UIKit

protocol DetailedBusinessLogic {
    func fetchDetailedInformation()
}

protocol DetailedDataStore {
    var character: CharResult? { get set }
}

class DetailedInteractor: DetailedBusinessLogic, DetailedDataStore {
    var character: CharResult?
    let network = Network()
    var presenter: DetailedPresentationLogic?
    var worker: DetailedWorker?
    
    // MARK: Do something
    
    func fetchDetailedInformation() {
        guard let imageString = character?.image,
              let url = URL(string: imageString) else {
            return
        }
                
        network.loadImage(for: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedImage):
                    let response = Detailed.displayDetailedInformation.Response(
                        name: self?.character?.name ?? "",
                        species: self?.character?.species ?? "",
                        image: fetchedImage)
                    self?.presenter?.presentDetailedInformation(response: response)
                case .failure(_):
                    break
                }
            }
        }
    }
}


