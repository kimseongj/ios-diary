# 일기장 📚

## 프로젝트 소개
> 코어데이터를 사용해 일기장을 추가, 수정, 삭제를 하는 어플리케이션
> 
> 프로젝트 기간: 2023.04.24 - 2023.05.12

## 목차 :book:


- [1. 팀원을 소개합니다 👀](#팀원을-소개합니다-) 
- [2. 시각화된 프로젝트 구조](#시각화된-프로젝트-구조)
    - [2-1. Class Diagram 🗺](#class-diagram-) 
    - [2-2. File Tree 🌲](#file-tree-) 
- [3. 타임라인 ⏰](#타임라인-) 
- [4. 실행 화면 🎬](#실행-화면-) 
- [5. 트러블슈팅 🚀](#트러블-슈팅-) 
- [6. Reference 📑](#reference-) 

</br>

## 팀원을 소개합니다 👀

|<center>[송준](https://github.com/kimseongj)</center> | <center> [릴라](https://github.com/juun97)</center> | 
|--- | --- |
|<Img src = "https://i.imgur.com/9Bd6NIT.png" width="300">| <img src="https://i.imgur.com/9M6jEo2.png" width=300>  |

</br>

## 시각화된 프로젝트 구조 

</br>

### File Tree 🌲

<details>
<summary> 파일 트리 보기</summary>

```typescript
Diary
├── Application
│    ├── AppDelegate.swift
│    └── SceneDelegate.swift
├── Controller
│    ├── DiaryDetailViewController.swift
│    └── DiaryViewController.swift
├── Extra
│    ├── DecodeManager
│    ├── DiaryDateFormatter
│    └── AlertManager.swift
│       
├── Localizable
│    ├── en.lproj
│    │    └── Localizable.strings
│    └── ko.lproj
│         └── Localizable.strings
├── Model
│    └── Diary.swift
├── Util
│    ├── Network
│    │    ├── EnpointMakable.swift
│    │    ├── OpenWeatherEndpoint.swift
│    │    ├── HTTPMethod.swift
│    │    ├── APIProvide.swift
│    │    └── NetworkError.swift
│    └── CoreData
│         ├── CoreDataManager.swift
│         ├── DiaryDataModel.xcdatamodeld
│         │    ├── DiaryDataModel 2.xcdatamodel
│         │    │   └── contents
│         │    └── DiaryDataModel.xcdatamodel
│         │        └── contents
│         ├── DiaryEntity+CoreDataClass.swift
│         └── DiaryEntity+CoreDataProperties.swift
│    
└── View
     ├── DiaryTableViewCell.swift
     └── TitleStackView.swift
```
    
</details>




</br>

## 타임라인 ⏰

| <center>날짜</center> | <center>타임라인</center> |
| --- | --- |
| **2023.04.24** | - SwiftLint 라이브러리 적용 </br>- 메인화면의 CollectionView 구현 </br>- JSONDecoder 구현|
| **2023.04.25** | - CollectionView를 TableView로 수정 </br> - Diffable DataSource를 적용 |
| **2023.04.26** | - TableView Cell 구현  |
| **2023.04.27** | - 전체 View에 Localization 설정 |
| **2023.04.28** | - 코드 리뷰 바탕으로 리팩토링  |
| **2023.05.01** | - 메인화면의 CollectionView 구현 </br>- JSONDecoder 구현|
| **2023.05.02** | - CollectionView를 TableView로 수정 </br> - Diffable DataSource를 적용 |
| **2023.05.03** | - TableView Cell 구현  |
| **2023.05.04** | - 전체 View에 Localization 설정 |
| **2023.05.05** | - 코드 리뷰 바탕으로 리팩토링  |
| **2023.05.08** | - 코드 리뷰 바탕으로 리팩토링 |
| **2023.05.09** | - Network Layer 기반 API 구현 </br> - OpenWeatherAPI에서 데이터 fetch 구현 |
| **2023.05.10** | - LocationManager를 통해 기기의 현재 위치 정보 받아오는 기능 구현 </br> - navigation TitleView 정의 및 적용   |
| **2023.05.11** | - DiaryDetailViewController에 대한 전체적인 리팩토링 |




</br>

## 실행 화면 🎬

| <center>셀 클릭시 세부정보 화면 이동</center>  | <center>키보드가 사용될 때 레이아웃 조정</center> | <center> 새로운 일기장 만들시 저장하기</center> |
| --- | --- | --- |
 | <img src="https://i.imgur.com/vomD5CG.gif" width =400> | <img src="https://hackmd.io/_uploads/H1WFFSo4n.gif" width =400> | <img src="https://hackmd.io/_uploads/rJf5FrjVh.gif" width =400> |

| <center> 셀 스와이프해서 데이터 삭제</center> | <center>더 보기에서 공유할시 Activity뷰 출력</center>  | <center>더 보기에서 삭제할시 데이터 삭제 및 이전화면 가기</center> | 
| --- | --- | --- |
| <img src="https://hackmd.io/_uploads/SkDstSs4n.gif" width =400> | <img src="https://hackmd.io/_uploads/SkxPhKHs4h.gif" width =400> | <img src="https://hackmd.io/_uploads/SJeJqrsNn.gif" width =400> | 



| <center>가로모드 전환시 레이아웃 조정</center>  | 
| --- | 
 | <img src="https://i.imgur.com/6g1lfQh.gif" width =600> | 



## 트러블 슈팅 🚀


### 1️⃣ lazy var 사용할 때의 메모리 효율성
프로퍼티를 선언하는 과정에서 let 으로 할지 lazy var 로 사용할지 에 대한 고민이 있었습니다.

- let 

let 의 경우 컴파일 시점에 미리 메모리에 올라가는 상태로 파악했고, 인스턴스가 initialize 되기 전까지 let 으로 구현된 프로퍼티 클로저 안에서는 다른 프로퍼티에 접근이 불가능 합니다.

- lazy var

lazy var 의 경우 런타임 시점에 해당 프로퍼티가 사용되는 시점에 메모리에 올라온다고 파악했고, 인스턴스가 initialize가 되지 않아도 다른 프로퍼티에 접근이 가능합니다. 

#### :fire: 결론
- 화면에서 반드시 보여질 필요가 없는(특정 경우에만 보여지는) view일 때 사용하는게 좋아 보입니다.
- 애플 공식 문서에를 참고했을 때, 다중 스레드로 접근하면 초기화가 한번만 되는것을 보장하지 않는다고 합니다. 즉, 단일 스레드 환경이 보장되지 않으면 lazy var를 쓰는 것은 지양해야될 거 같습니다.

### 2️⃣ scrollView와 textView의 스크롤 문제
- ScrollView 내부에 textView를 구현할 경우 textView가 나오지 않는 오류가 발생합니다. 이 오류의 원인을 파악해본 결과 UITextView가 UIScrollView를 상속받고 있어, 두 개의 ScrollView 기능이 충돌되어 textView가 나오지 않는 것으로 판단하였습니다.

![](https://i.imgur.com/l6XYPAe.png)

- 이 문제를 해결하기 위해 TextView를 선언할 때 아래와 같은 코드로, `isScrollEnabled = false`로 작성하여 textView의 스크롤 기능을 삭제하여 해결하였습니다.

```Swift
private lazy var bodyTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = false
        textView.layer.borderWidth = 0.8
        textView.layer.cornerRadius = 4
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        return textView
    }()
```

### 3️⃣ textView Placeholder 구현
- textView의 경우 texField와 다르게 Placeholder를 직접 구현해줘야 합니다.
- 아래는 Placeholder를 구현한 모습입니다.
    - `hasPlaceholder`라는 연산 프로퍼티를 선언하여, placeholder의 존재 여부를 파악합니다.
    - `hasPlaceholder`로 분기처리를 하여 `UITextViewDelegate`에 존재하는 `textViewDidBeginEditing`, `textViewDidEndEditing`메서드에 접근하여 Placeholder를 구현했습니다.

```swift
extension DiaryDetailViewController: UITextViewDelegate {
    private var hasPlaceholder: Bool {
        if bodyTextView.textColor == UIColor.lightGray && bodyTextView.text == String.localized(key: LocalizationKey.bodyTextViewPlaceHolder) {
            return true
        } else {
            return false
        }
    }
    
    private func placeholderSetting() {
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: String.localized(key: LocalizationKey.titleTextFieldPlaceHolder),
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        bodyTextView.delegate = self
        bodyTextView.text = String.localized(key: LocalizationKey.bodyTextViewPlaceHolder)
        bodyTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if hasPlaceholder == true {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = String.localized(key: LocalizationKey.bodyTextViewPlaceHolder)
            textView.textColor = UIColor.lightGray
        }
    }
}
```

### 4️⃣ Compression resistance priority를 이용한 label 크기 문제 해결
`Horizontal StackView`를 사용하여 두개의 `Label`을 넣는 방식을 사용할 때, 텍스트의 길이가 긴 `Label`이  짧은 `Label`을 잡아 먹는 경우가 생겼습니다. 이를 해결하기 위해 날짜`Label`에 Compression Resistance Priority를 활용하여 수정하였습니다. Compression Resistance Priority이란 해석하면 압축을 저항하는 우선순위로, Priority 값이 높은 쪽이 형태를 유지하고, 낮은 쪽의 형태가 압축됩니다.

| <center>수정 전</center> | <center>수정 후</center>|
| --- | --- |
| <img src="https://i.imgur.com/6UnpsPX.png" width =300> |<img src="https://i.imgur.com/EEzqiEV.png" width =300> |

### 5️⃣ CoreData의 Create와 Update 메서드 병합 OR 분리
#### - 1. 병합
CoreData 의 `CRUD` 를 구현하는 과정에서 `Create` 와 `Update` 의 구성이 비슷하다고 생각을 해 하나의 메서드로 같이 사용할 수 있지 않을까 생각을 했고 병합을 해보았습니다.

```swift
    func register(_ diary: Diary) {
        let context = persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: DiaryKey.EntityName, in: context) else { return }
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: DiaryKey.EntityName)
        fetchRequest.predicate = NSPredicate(format: "id == %@", diary.id as CVarArg)
        
        let fetchedObject = try? context.fetch(fetchRequest)[safe: 0] as? NSManagedObject ?? NSManagedObject(entity: entity, insertInto: context)
        
        setNSDiaryValue(for: diary, at: fetchedObject)
        
        saveContext()
    }
```

 diary의 id를 기준으로 해당 id 의 저장된 값 유무를 구별해 fetchedObject 에 알맞는 NSManagedObject 를 할당 하도록 했습니다.

- 있는 경우(Update)
```swift
context.fetch(fetchRequest)[safe: 0] as? NSManagedObject
```

- 없는 경우(Create)
```swift
NSManagedObject(entity: entity, insertInto: context)
```

이 때 생기는 아쉬운 점은 최대한 병합을 하려다 보니 코드 한줄한줄이 굉장히 길어지게 되었고 가독성이 조금 떨어지게 되었습니다.

#### - 2. 분리 
위의 문제를 해결하기 위해 메서드의 재사용성보다는 기능분리에 초점을 두었습니다.
DiaryDetailViewController에서 하나의 메서드를 불러오고 그 메서드 내부에서 분기처리하는 대신 
Create와 Update를 나누어 구현했습니다.

```swift
func create(_ diary: Diary) {
        let context = persistentContainer.viewContext
        let storage = DiaryEntity(context: context)
        
        setNSDiaryValue(for: diary, at: storage)
        saveContext()
    }
    
    func update(_ diary: Diary) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: DiaryKey.EntityName)
        fetchRequest.predicate = NSPredicate(format: "id == %@", diary.id as CVarArg)
        
        do {
            let test = try context.fetch(fetchRequest)
            let objectUpdate = test[0] as? NSManagedObject
            
            setNSDiaryValue(for: diary, at: objectUpdate)
            saveContext()
        } catch {
            print(error)
        }
    }
```
:fire: 메서드의 기능분리와 재사용성의 적절한 조화가 필요하다고 느꼈습니다.

### 6️⃣ 공통 Alert 구현 위치
Alert를 구현하는 메서드들이 하나의 ViewController에서만 사용되는 것이 아닌, 두 개의 ViewController에서 사용됩니다. 두 ViewController에 Alert를 구현하는 방식보다 재사용성을 위해 `UIViewController`에 `extension`하여 Alert메서드를 구현하는 방식을 채택하였습니다. 이렇게 될 경우 UIViewController를 채택하는 모든 ViewController에서 Alert를 구현할 수 있다는 점, ViewController를 파라미터로 받을 필요가 없다는 점 등이 있었습니다. 하지만 Alert가 필요한 두 개의 ViewController 외에 다른 ViewController까지 들고 갈 필요가 있느냐에 대한 문제점이 발생합니다. 위 문제에 대해는 조금 더 깊게 고민해봐야 될 부분인 것 같습니다.

### 7️⃣ DateFormatter의 재사용
![](https://i.imgur.com/JNr7N4L.png)
DateFormatter는 위에 문서 내용과 같이 값비싼 동작임을 알 수 있습니다. 그렇기에 DateFormatter의 경우 새로운 인스턴스 생성을 많이 하는 것은 부적절합니다. 이를 해결하기 위해 `DiaryDateFormatter`라는 새로운 구조체를 만들고, 싱글톤 형태로 구현하였습니다.

<details>
<summary>코드 보기</summary>
    
```swift
final class DiaryDateFormatter {
    private enum LocalizationKey {
        static let dateFormat = "dateFormat"
    }
    
    static let shared = DiaryDateFormatter()
    private let dateFormatter = DateFormatter()
    
    lazy var nowDateText: String = {
        return convertToString(from: Date())
    }()
    
    lazy var nowTimeIntervalSince1970: Int = {
        return convertToInterval(from: Date())
    }()
    
    private init() { }
    
    func convertToInterval(from date: Date) -> Int {
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let localDateString = dateFormatter.string(from: date)
        let localDate = dateFormatter.date(from: localDateString) ?? Date()
        
        return Int(localDate.timeIntervalSince1970)
    }
    
    func convertToInterval(from date: String) -> Int {
        dateFormatter.dateFormat = LocalizationKey.dateFormat.localized()
        let localDate = dateFormatter.date(from: date) ?? Date()
        
        return Int(localDate.timeIntervalSince1970)
    }
    
    func convertToString(from date: Date) -> String {
        dateFormatter.dateFormat = LocalizationKey.dateFormat.localized()
        let convertString = dateFormatter.string(from: date)
        
        return convertString
    }
    
    func convertToString(from timeIntervalSince1970: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeIntervalSince1970))
        dateFormatter.dateFormat = LocalizationKey.dateFormat.localized()
        let convertString = dateFormatter.string(from: date)
        
        return convertString
    }
}

```
</details>


### 8️⃣ DiaryViewController 의 기능 분리

기존의 DiaryVC 는 UI 작업을 비롯해 Network 를 사용한 데이터 fetching, CoreLocation 을 활용한 위치정보 fetching 등 많은 일을 담당하고 있엇습니다.

하나의 VC 에서 너무 많은 일을 하고 있다보니 코드는 자연스럽게 매우 길어지게 되었고, 코드가 길어짐은 가독성을 해치는 결과로 이어졌습니다.


#### DiaryViewConroller 의 작업을 분담을 객체를 만들자

저희는 이를 해결하기 위해 기존 DiaryVC 가 하고있던 일을 분담할 객체인 DiaryService를 생성하기로 결정했습니다.

DiaryVC 는 UI 관련 작업만하고 그 외의 Network, 위치정보등의 부가적인 작업은 DiaryService 가 작업을 담당하도록 했습니다.

<details>
<summary> 코드 보기</summary>

```swift
final class DiaryService: NSObject {
    private let provider = APIProvider()
    private let locationManager = CLLocationManager()
    private var endPoint = OpenWeatherEndpoint()
    
    private var latitude: Double = 0
    private var longitude: Double = 0
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func fetchWeatherIcon(completion: @escaping (Data?) -> Void) {
        endPoint.updateQuery(lat: String(latitude), lon: String(longitude))
        
        guard let request = endPoint.makeURLRequest() else { return }
        
        provider.fetchData(request: request) { [weak self] result in
            guard let weatherInfo = self?.decodeFetchedWeather(fetchedData: result),
                  let request = self?.endPoint.makeURLRequest(iconId: weatherInfo.iconId) else { return }
            
            self?.provider.fetchData(request: request) { result in
                let iconData = try? self?.verifyResult(result: result)
                completion(iconData)
            }
        }
    }
    
    private func decodeFetchedWeather(fetchedData: (Result<Data, NetworkError>)) -> DailyWeather.WeatherInfo? {
        guard let data = try? self.verifyResult(result: fetchedData),
              let dailyWeather = DecodeManager().decode(data: data, type: DailyWeather.self),
              let weatherInfo = dailyWeather.information.first  else { return nil }
        
       return weatherInfo
    }
    
    private func verifyResult<T, E: Error>(result: Result<T, E>) throws -> T {
        switch result {
        case.success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
}

extension DiaryService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
            self.locationManager.startUpdatingLocation()
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
        case .denied:
            print("GPS 권한 요청 거부됨")
        default:
            print("GPS: Default")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = locations.last else { return }
        let longitude: CLLocationDegrees = location.coordinate.longitude
        let latitude: CLLocationDegrees = location.coordinate.latitude

        self.latitude = Double(latitude)
        self.longitude = Double(longitude)
        
        manager.stopUpdatingLocation()
    }
}
```

</details>



## Reference 📑
- [UITextView - Apple Document](https://developer.apple.com/documentation/uikit/uitextview)
- [DateFormatter - Apple Document](https://developer.apple.com/documentation/foundation/dateformatter)
- [CoreData - Apple Document](https://developer.apple.com/documentation/coredata)
- [Setting Up a Core Data Stack - Apple Document](https://developer.apple.com/documentation/coredata/setting_up_a_core_data_stack)
- [Creating a Core Data Model - Apple Document](https://developer.apple.com/documentation/coredata/creating_a_core_data_model)



