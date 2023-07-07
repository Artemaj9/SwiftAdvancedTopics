//
//  GenericsBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 07.07.2023.
//

import SwiftUI


struct StringModel {
    let info: String?
    func removeInfo() ->StringModel {
      StringModel(info: nil)
    }
}


struct GenericModel<CustomType> {
    let info: CustomType?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}
    
    
    
class GenericsViewModel : ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var genericStringModel = GenericModel(info: "Hello world")
    @Published var genericBoolModel = GenericModel(info: true)
    func removeData() {
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }

}

struct GenericView<CustomType: View>: View {
    
    let content: CustomType
    let title: String
    var body: some View {
        VStack{
  
            Text(title)
            content
        }
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("custom content"), title: "new View!")
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
                .onTapGesture {
                    vm.removeData()
                }
        }
    }
}
struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}
