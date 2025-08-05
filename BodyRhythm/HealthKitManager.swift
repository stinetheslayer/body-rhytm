import Foundation
import HealthKit

class HealthKitManager: ObservableObject {
    private let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let readTypes: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .bodyMass)!,
            HKObjectType.quantityType(forIdentifier: .height)!,
            HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!
        ]
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func fetchProfileData(completion: @escaping (String?, String?, String?) -> Void) {
        var ageString: String?
        var weightString: String?
        var heightString: String?
        
        // Age
        if let birthDate = try? healthStore.dateOfBirthComponents().date {
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
            if let age = ageComponents.year {
                ageString = "\(age)"
            }
        }
        
        // Weight
        let weightType = HKSampleType.quantityType(forIdentifier: .bodyMass)!
        let weightQuery = HKSampleQuery(sampleType: weightType, predicate: nil, limit: 1, sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)]) { _, results, _ in
            if let result = results?.first as? HKQuantitySample {
                let weight = result.quantity.doubleValue(for: .gramUnit(with: .kilo))
                weightString = String(format: "%.1f kg", weight)
            }
            // Height
            let heightType = HKSampleType.quantityType(forIdentifier: .height)!
            let heightQuery = HKSampleQuery(sampleType: heightType, predicate: nil, limit: 1, sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)]) { _, results, _ in
                if let result = results?.first as? HKQuantitySample {
                    let height = result.quantity.doubleValue(for: .meter())
                    heightString = String(format: "%.0f cm", height * 100)
                }
                DispatchQueue.main.async {
                    completion(ageString, weightString, heightString)
                }
            }
            self.healthStore.execute(heightQuery)
        }
        self.healthStore.execute(weightQuery)
    }
}
