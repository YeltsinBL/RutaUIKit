//
//  ApiClient.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 22/01/23.
//

import Foundation
//creamos las struct para parsear el Json que recibimos al hacer la petición Http a un objeto de nuestro dominio
struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}
struct PokemonsRespondeDataModel: Decodable {
    let pokemons: [PokemonDataModel] //Pasamos en un array el modelo
    
    enum CodingKeys: String, CodingKey{
        case results
    }
//    este init custom simplifica el modelo
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}

//creamos el protocolo que servirá para enviar los datos a la vista
//agregamos AnyObject para que sea una referencia débil
protocol ApiClientDelegate: AnyObject {
    func update(pokemons: PokemonsRespondeDataModel)
}

class ApiClient {
//    creamos una propiedad y le hacemos una referencia débil con 'weak'
    weak var delegate: ApiClientDelegate?
    
    func getPokemons(){
//        creamos el endpoint al que vamos a llamar cuando se haga la petición http
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")!
//        se encarga de hacer la petición
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let dataModel = try! JSONDecoder().decode(PokemonsRespondeDataModel.self, from: data!)
//            enviamos el modelo a la vista
            self.delegate?.update(pokemons: dataModel)
        }
        task.resume()
        
    }
}
