//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by Adarsh Ranjan on 29/12/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var text = ""
    @FetchRequest(entity: Fruit.entity(), sortDescriptors: []) var fruits: FetchedResults<Fruit>

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter New Fruit", text: $text)
                    .padding(.leading)
                List {
                    ForEach(fruits) { fruit in
                        Text("\(fruit.name ?? "Unnamed") (\(fruit.isSweet ? "Sweet" : "Bitter"))")
                            .onTapGesture {
                                updateItem(fruit: fruit)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newFruit = Fruit(context: viewContext)
            newFruit.name = text
            newFruit.isSweet = Bool.random()
            saveItems()
            text.removeAll()
        }
    }

    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let fruit = fruits[index]
            viewContext.delete(fruit)
            saveItems()
        }
    }
    
    private func updateItem(fruit: Fruit) {
        let isSweet = fruit.isSweet
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"
        fruit.name = newName
        fruit.isSweet = isSweet ? false : true
        saveItems()
    }
}

// Preview section with mock data
#Preview {
    let previewController = PersistenceController.preview
    let context = previewController.container.viewContext

    // Adding mock data for preview
    let newFruit1 = Fruit(context: context)
    newFruit1.name = "Apple"

    let newFruit2 = Fruit(context: context)
    newFruit2.name = "Banana"

    return ContentView().environment(\.managedObjectContext, context)
}
