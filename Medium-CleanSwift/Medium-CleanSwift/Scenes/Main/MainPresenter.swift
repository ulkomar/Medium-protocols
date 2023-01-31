import UIKit

protocol MainPresentationLogic {
    // напоминаю, что без отображения этой функции в протоколе
    // ее просто не увидит наш интерактор
    func presentFetchedCartoonCharacters(response: Main.displayCartoonCharacters.Response)
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?
    
    // MARK: Do something
    
    func presentFetchedCartoonCharacters(response: Main.displayCartoonCharacters.Response) {
        
        // извлекаем данные переданные от интерактора
        let characterArray = response.characters
        
        // в эту переменную мы поместим "очищенные данные"
        var characterInformation: [Main.displayCartoonCharacters.ViewModel.characterInformationModel] = []
        
        // проводим итерации для "очистки" данных от ненужных для отображения
        for character in characterArray {
            let characterModel = Main.displayCartoonCharacters.ViewModel.characterInformationModel(
                id: character.id,
                name: character.name,
                species: character.species)
            characterInformation.append(characterModel)
        }
        
        // создаем viewModel, который мы "закинем" во вью контроллер
        let viewModel = Main.displayCartoonCharacters.ViewModel(characterInformation: characterInformation)
        
        // та самая функция во вью контроллере,
        // куда будут переданы "очищенные" данные
        viewController?.addCharactersToVariable(viewModel: viewModel)
    }
}
