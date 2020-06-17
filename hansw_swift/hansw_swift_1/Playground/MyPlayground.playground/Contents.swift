import UIKit
import PlaygroundSupport
//import Alamofire

PlaygroundPage.current.needsIndefiniteExecution = true
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 변수&자료구조 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
////변수는 var로 선언
////상수는 let으로 선언
//var firstStr = "Hello, playground"
//let myName = "한상원"
//var secondStr = """
//Hello? \
//My name is\
//SANGWON HANS
//"""
//var thirdStr = "my name is \(myName)"
//
//let album: String = "Reputation"
//let year: Int = 1989
//let height: Double = 1.78
//let taylorRocks: Bool = true
//
//let one = "one"
//let two = "two"
//let three = "three"
//let Arraytest = [one, two, three]
//var log = Arraytest[2]


//-----------------------------------------------------------------------------
//var name = (first: "Taylor", last: "Swift")
//name.0
//name.first
//name.last
//name.1
//
//let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
//let set = Set(["aardvark", "astronaut", "azalea"])
//let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

//-----------------------------------------------------------------------------
//let heights = [
//    "Taylor Swift": 1.11,
//    "Ed Sheeran": 2.22
//]
//heights["Taylor Swift"]
//-----------------------------------------------------------------------------
//
//let favoriteIceCream = [
//    "Paul": "Chocolate",
//    "Sophie": "Vanilla"
//]
//
//favoriteIceCream["Paul"]
//favoriteIceCream["Charlotte"]
//favoriteIceCream["Chocolate"]
//favoriteIceCream["Charlotte", default: "Unknown"]
//-----------------------------------------------------------------------------
//
//var teams = [String: String]()
//teams["Paul"] = "Red"
//
//var teams2 = [NSString: Int]()
//teams2["number1"] = 1
//teams2
//
//var results = [Int]()
//var words = Set<String>()
//var numbers = Set<Int>()
//var scores = Dictionary<String, Int>()
//var resultsArray = Array<Int>()
//
//resultsArray.append(1)
//resultsArray.append(2)
////-----------------------------------------------------------------------------
//
//let result = "failure"
//
//let result2 = "failed"
//let result3 = "fail"
//
//enum Result {
//    case success
//    case failure
//}
//let result4 = Result.failure
//
//enum CompoassPoint: String {
//  case north
//  case south="South1", east="East1", west="West1"
//}
//
//let p = CompoassPoint.north
//p.rawValue
//CompoassPoint.south.rawValue
////dump(p.rawValue) // "north"
////dump(CompoassPoint.south.rawValue) // "South1"
//
//enum AAAA:Int
//{
//    case one = 1
//    case two = 2
//}
//var a: AAAA = .one
//var b = AAAA.one.rawValue
//var c = AAAA(rawValue: 2)
////-----------------------------------------------------------------------------
//
//enum Activity {
//    case bored
//    case running(destination: String)
//    case talking(topic: String)
//    case singing(volume: Int)
//}
//let talking = Activity.talking(topic: "football")
//
//let singing = Activity.singing(volume: 1)
////-----------------------------------------------------------------------------
////enum Planet: Int {
////    case mercury
////    case venus
////    case earth
////    case mars
////}
//enum Planet: Int {
//    case mercury = 1
//    case venus
//    case earth
//    case mars
//}
//let earth = Planet(rawValue: 2)
////-----------------------------------------------------------------------------
//
//var quote = "The rain in Spain falls mainly on the "
//quote += "Spaniards"
//
//var array1 = ["one","two"]
//var array2 = ["three","four"]
//var array3 = array1 + array2
//
//let firstScore = 6
//let secondScore = 4
//
//
//// == ,!= , < , >=
// if("Abb" < "Ax") //앞에 알파벳이 뭐냐에 따라 다르네?!
//{
//    print("출력1")
//}
//else
//{
//    print("출력2")
//}
////-----------------------------------------------------------------------------
//let firstCard = 11
//let secondCard = 10
//
//if firstCard + secondCard == 21 {
//    print("Blackjack!")
//}
//////-----------------------------------------------------------------------------
//print(firstCard == secondCard ?"same":"not same")
//
//var weather = 1
//
//switch weather {
//case 1:
//    print("1")
//        fallthrough // 그 다음꺼 까지만 실행이 된다..
//case 2:
//    print("2")
//case 3:
//    print("3")
//default:
//    print("0")
//    print("00")
//    print("000")
//}
//////-----------------------------------------------------------------------------
//let score = 85
//switch score {
//case 0..<50:
//    print("You failed badly.")
//case 50..<85:
//    print("You did OK.")
//case 85..<100:
//    print("You score is good")
//default:
//    print("You did great!")
//}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 반복문 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
// for 문
//let count = 1...10
//for number in count {
//    print("Number is \(number)")
//}
//
//let albums = ["Red", "1989", "Reputation"]
//for album in albums {
//    print("\(album) is on Apple Music")
//}
//for num in 1...10
//{
//    print("한상원 \(num)")
//}
//
//for _ in 1...5 {
//    print("play")
//}
//------------------------------//------------------------------
//while 문
//var number = 1
//
//while number <= 0 {
//    print(number)
//    number += 1
//}
//print("Ready or not, here I come!")
//print("")
//
//
////블럭을 한번 실행하고 진행한다.
//repeat {
//    print(number)
//    number += 1
//} while number <= 0
//
//print("Ready or not, here I come!")

//var countDown = 10
//
//while countDown >= 0 {
//    print(countDown)
//
//    if countDown == 4 {
//        print("I'm bored. Let's go now!")
//        break
//    }
//
//    countDown -= 1
//}
//-----------------------------------------------------------------------------
// 구구단
//for i in 1...9 {
//    for j in 1...9 {
//        if (j == 1 && i != 1){
//            print("")
//        }
//        let product = i * j
//        print ("\(i) * \(j) is \(product)")
//    }
//}
//-----------------------------------------------------------------------------
//outerLoop: for i in 1...10 {
//    for j in 1...10 {
//        let product = i * j
//        print ("\(i) * \(j) is \(product)")
//    }
//}
//outerLoop: for i in 1...10 {
//
//    print("한상원 : \(i)")
//    for j in 1...10 {
//        let product = i * j
//        print ("\(i) * \(j) is \(product)")
//
//        if product == 50 {
//            print("It's a bullseye!")
//            break outerLoop //이렇게하면 밖의 for 문도 함께 같이 멈춘다
//            //break 만 했을 경우에는 안쪽은 멈추지만 밖의 for문은 계속해서 돌아간다.
//        }
//    }
//}
//var i = 1...5
//var num: Int = 0
//outerLoopWhile: while num < i.count
//{
//    print("print num : \(num)")
//    num += 1
//
//    if(num == 3)
//    {
//        break outerLoopWhile
//    }
//}
//-----------------------------------------------------------------------------
//for i in 1...10 {
//    print("test : \(i)")
//    if i % 2 == 1 {
//        continue
//    }
//    print(i)
//}
//-----------------------------------------------------------------------------
//var counter = 0
//
//while true {
//    print(" ")
//    counter += 1
//
//    if counter == 3 {
//        break
//    }
//}
//print("print")







//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 함수 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

//func printHelp() // 함수 정의
//{
//    let message = """
//Welcome to MyApp!
//Run this app inside a directory of images and
//MyApp will resize them all into thumbnails
//"""
//
//    print(message)
//}
//printHelp() // 함수 호출
//------------------------------------------------------------------------------------
//func myNameIs(name :String){
//
//    print("제 이름은 \(name)입니다.")
//}
//myNameIs(name: "이수정")
//------------------------------------------------------------------------------------
//func sumFunc (firstNum:Int, secondNum:Int) -> String
//{
//    return String(firstNum + secondNum)
//}
//
//var sum = (sumFunc(firstNum: 2, secondNum: 2))
//print("더하기의 합은 \(sum)")
//------------------------------------------------------------------------------------
//func sayHello(to name: String) {
//    print("Hello, \(name)!")
//}
//sayHello(to: "Sang Won")
//------------------------------------------------------------------------------------
//func myNameandAge(_ age:Int , _ name:String){
//
//    print("My name is \(name)"
//        + "and I'm \(age) years old")
//}
//
//myNameandAge(28, "한상원")
//
//------------------------------------------------------------------------------------
// func greet(_ person: String, nicely: Bool = true) {
//     if nicely == true {
//         print("Hello, \(person)!")
//     } else {
//         print("Oh no, it's \(person) again...")
//     }
// }
//greet("Taylor")
//greet("Taylor", nicely: false)
//------------------------------------------------------------------------------------
//함수 파라미터 관련
//func square(numbers: Int...) {
//    for number in numbers {
//        print("\(number) squared is \(number * number)")
//    }
//}
//square(numbers: 1, 2, 3, 4, 5)
//
//func MyPrint(_ string:String...)
//{
//    for str in string
//    {
//        print("print : \(str)")
//    }
//}
//
//MyPrint("한상원","이수정","한상희", "이수미")
//------------------------------------------------------------------------------------
//에러 핸들링
//enum PasswordError: Error {
//    case obvious
//}
//func checkPassword(_ password: String) throws -> Bool {
//    guard password == "password" else {
//        throw PasswordError.obvious
//    }
//
//    return true
//}
////throws가 포함된 함수를 호출하려면, 당신은 반드시 try 키워드를 포함해야합니다:
//
//do {
//  let check = try checkPassword("password")
//    print(check);
//}
//catch PasswordError.obvious{
//    print("You Wrong password")
//}
//catch {
//
//   print(error)
//}
//------------------------------------------------------------------------------------
// 콜바이 레퍼런스
//func doubleInPlace(number: inout Int) {
//    number *= 2
//}
//
//var myNum = 10
//doubleInPlace(number: &myNum)
//------------------------------------------------------------------------------------
////------------------------------------------------------------------------------------클로져1
//let driving = {
//    print("I'm driving in my car")
//}
//driving()

////------------------------------------------------------------------------------------클로져2
//let driving = {
//    (place:String) in
//    print("I'm going to \(place) in my car")
//}
//driving("Korea")

//func viewName (string:String)->String
//{
//    return "viewName : " + string
//}
//let isView = {
//    (place:String) in
//    print("is Viwe = \(viewName(string:place))")
//}
//isView("MainView")

////------------------------------------------------------------------------------------클로져3
//let drivingWithReturn = {
//    (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}
//
//let message = drivingWithReturn("London")
//print(message)

////------------------------------------------------------------------------------------클로져4
//let driving = {
//    print("I'm driving in my car")
//}
//
//func travel(action: () -> Void){
//    print("I'm getting ready to go.")
//    action()
//    print("I arrived!")
//}
//
//travel(action: driving)

////------------------------------------------------------------------------------------클로져5
//func travel(action: () -> Void) {
//    print("I'm getting ready to go.")
//    action()
//    print("I arrived!")
//}
//travel() {
//    print("I'm driving in my car") //-> 이 녀석이 들어가는 action()
//}
//
//travel { // 넣는 갑이 없으니 ()를 생략하여 호출할 수도 있다.
//    print("I'm driving in my car") //-> 이 녀석이 들어가는 action()
//}

////------------------------------------------------------------------------------------클로져6
//func travel(action: (String) -> Void) {
//    print("I'm getting ready to go.")
//    action("London")
//    print("I arrived!")
//}
//
//travel {
//    (place:String) in
//    print("I'm going to \(place) in my car")
//}

////------------------------------------------------------------------------------------클로져7
//func travel(action: (String) -> String) {
//    print("I'm getting ready to go.")
//    let description = action("London")
//    print(description)
//    print("I arrived!")
//}
//
//travel {
//    (place:String) -> String in
//     return "I'm going to \(place) in my car"
//}

////------------------------------------------------------------------------------------클로져8
//func travel(action: (String) -> String) {
//    print("I'm getting ready to go.")
//    let description = action("London")
//    print(description)
//    print("I arrived!")
//}
//travel { (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}
//
//travel { place -> String in
//    return "I'm going to \(place) in my car"
//}
//
//travel { place in
//    return "I'm going to \(place) in my car"
//}
//
//travel { place in
//    "I'm going to \(place) in my car"
//}

//travel {
//    "I'm going to \($0) in my car"
//}

////------------------------------------------------------------------------------------클로져9
//func travel(action: (String, Int) -> String) {
//    print("I'm getting ready to go.")
//    let description = action("London", 60)
//    print(description)
//    print("I arrived!")
//}
//
//travel {
//    "I'm going to \($0) at \($1) miles per hour."
//}

////------------------------------------------------------------------------------------클로져10
//func travel() ->(String) ->Void{
//    return{
//            print("I'm going to \($0)")
//    }
//}
//let result = travel()
//result("London")
//
//let result2:Void = travel()("London")

////------------------------------------------------------------------------------------클로져11
//func travel() -> (String) -> Void {
//    var counter = 1
//    return {
//        print("\(counter). I'm going to \($0)")
//        counter += 1
//    }
//}
//let result = travel()
//result("London")
//result("Busan")
//result("Seoul")

//###############################################[8Day]#################################################

//struct 구조체 1
//struct Sport {
//    var name:String
//}
//
//var tennis = Sport(name:"Tennis")
//print(tennis.name)
//tennis.name = "Lanw tennis"

//struct 구조체 2
//struct Sport {
//    var name:String
//    var isOlympicSport:Bool
//
//    var olympicStatus: String{
//        if isOlympicSport {
//            return "\(name) is an Olympic sport"
//        }
//        else {
//            return "\(name) is not an Olympic sport"
//        }
//    }
//}
//
//let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
//print(chessBoxing.olympicStatus)

//struct 구조체 3
//struct Progress{
//    var task : String
//    var amount : Int{
//        didSet{ //30,80,100
//            print("\(task) is now \(amount)% complete")
//        }
////        willSet{ // 0,30,80
////            print("\(task) is now \(amount)% complete")
////        }
//    }
//}
//
//
//var progress = Progress(task: "Loading data", amount: 0)
//
//progress.amount = 30
//progress.amount = 80
//progress.amount = 100

//struct 구조체 4
//struct City{
//    var population:Int
//
//    func collectTaxes() -> Int {
//        return population * 1000
//    }
//}
//
//let london = City(population: 9_000_000)
//london.collectTaxes();

//struct 구조체 5
//struct Person{
//    var name:String
//    //구조체 즉 value type일때는 속성값을 변경할 수 없는데 mutating를 사용하면 가능하다.
//    mutating func makeAnonymous() {
//        name = "Anonymous"
//    }
//}
//
//var person = Person(name: "Ed")
//print(person.name)
//person.makeAnonymous()
//print(person.name)

////----------------------------------------------------String 사용법
//let string = "Do or do not, there is no try."
//
////공백 문자열도 포함한다.
//print(string.count)
//
//// 문자열 찾기
//print(string.hasPrefix("Do"))
////모두 대문자
//print(string.uppercased())
////오름 차순 정렬
//print(string.sorted())

////----------------------------------------------------Arrays 사용법
//var toys = ["Woody"]
//
//print(toys.count)
//toys.append("Buzz")
////항목을 찾는 함수
//toys.firstIndex(of: "Buzz")
//toys.firstIndex(of: "Woody")
////오름차순
//print(toys.sorted())
//toys.remove(at: 0)
//
//
//var arr = [3,35,5,32,1]
////오름 차순
//arr.sort()
//print(arr)
////내림차순
//arr.sort(by: >)
//print(arr)
//
//print(arr.sorted())
//print(arr)
///*
// sort는 호출된 배열을 변경하여 값들이 정렬됩니다.
// 반면 sorted는 정렬된 값으로 된 배열의 사본을 리턴합니다.
//*/

////----------------------------------------------------Initializers (생성자)
//struct User
//{
//    var username: String
//
//    init(){
//        username = "Anonymous"
//        print("Creating a new user!")
//    }
//}
//var user = User()
//print(user.username)
//user.username = "twostraws"
//print(user.username)

////생성자 2
//struct Person {
//    var name : String
//
//    init(name:String) {
//           print("\(name) was born!")
//           self.name = name
//       }
//}
//var person = Person(name: "Ed")
//print(person.name)



////----------------------------------------------------Lazy // 잘 이해하고 넘어갔는지 모르겠네...?
/*
 lazy는 메모리와 관련이 있는데 특정 변수에 값을 계속해서 가지고 있는 것이아니라
 access 한 시점에 값을 받아 메모리에 넣는 작업을 한다.
 */
//struct FamilyTree {
//    init() {
//        print("Creating family tree!")
//    }
//}
//struct Person {
//    var name: String
//    //var familyTree = FamilyTree()
//    lazy var familyTree = FamilyTree()
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//var ed = Person(name: "Ed")
//ed.familyTree

//참조문서
//https://baked-corn.tistory.com/45

////------------------------------------------------------ static
//struct Student {
//
//    var name : String
//    static var classSixe = 0
//
//    init(name:String){
//        self.name = name
//        Student.classSixe += 1
//    }
//}
//
//print(Student.classSixe)
//let ed = Student(name: "Ed")
//print(Student.classSixe)
//let taylor = Student(name: "Taylor")
//print(Student.classSixe)

////------------------------------------------------------ private
//struct Person {
//    private var id: String
//
//    init(id: String) {
//        self.id = id
//    }
//
//    func identify() -> String {
//        return "My social security number is \(id)"
//    }
//}
//
//let personCode = Person(id: "1234")
//print(personCode.identify())

//###############################################[10Day]#################################################

////------------------------------------------------------ class 생성
//class Dog {
//    var name : String
//    var breed : String
//
//    init (name:String, breed:String){
//        self.name = name
//        self.breed = breed
//    }
//}
//let poppy = Dog(name: "Poppy", breed: "Poodle")
//print(poppy.name)
//print(poppy.breed)

////------------------------------------------------------ class  inheritance (상속)
//class Dog {
//    var name: String
//    var breed: String
//
//    init(name: String, breed: String) {
//        self.name = name
//        self.breed = breed
//    }
//}
////상속
//class Poodle:Dog
//{
//    init(name:String) {
//        super.init(name: name, breed: "Poodle")
//    }
//}
////------------------------------------------------------ class override (재정의)
//class Dog{
//    func makeNoise(){
//        print("Woof!")
//    }
//}
//
//class Poodle: Dog{
//    override func makeNoise() {
//        print("Yip!")
//    }
//}
//let poppy = Poodle() //객체 생성
//poppy.makeNoise() // 부모클래스에 있는 함수를 사용

////------------------------------------------------------ class final
//final 키워드를 사용하면 클래스를 상속받지 못한다.
//final class Dog {
//    var name : String
//    var breed : String
//
//    init(name:String, breed:String) {
//        self.name = name
//        self.breed = breed
//    }
//}
//////------------------------------------------------------ Copying objects class
//class Singer {
//    var name = "Taylor Swift"
//}
//
//var singer = Singer()
//print(singer.name)
////복사하여 값을 넣는다.
//var singerCopy = singer
//singerCopy.name = "Justin Bieber"
//
//print(singer.name)
//print("")
//////------------------------------------------------------ Copying objects struct
//struct AAA  {
//    var name = "AAA"
//}
//
//var aaa = AAA()
//print(aaa.name)
////복사하여 값을 넣는다.
//var bbb = aaa;
//bbb.name = "BBB"
//
//print(aaa.name)

/*
 클래서의 경우 객체를 복사하여 맴버에 값을 대입하면 오리지널 객체도 함께 변경되는 것을 볼 수 있다.
 이는 주소값에 있는 것을 가져와 적용하기 때문이다.
 그러나 구조체의 경우 복사여 값을 넣는다 하더라고 원본 객체의 값연 변하지 않는다.
*/
////------------------------------------------------------ Deinitializers (소멸자)
//class Person {
//    var name = "John Doe"
//
//    init() {
//        print("\(name) is alive!")
//    }
//
//    func printGreeting() {
//        print("Hello, I'm \(name)")
//    }
//    //소멸자
//    deinit {
//        //객체가 소멸된면 불러진다.
//        print("\(name) is no more!")
//    }
//}
//
//for _ in 1...3 {
//    let person = Person()
//    person.printGreeting()
//}

////------------------------------------------------------ Mutability
//class Singer {
//    var name = "Talor Swift"
//    //let name = "Talor Swift" //-> name에 접근하지 못함
//}
//
//let taylor = Singer()
//taylor.name = "Ed Sheeran"
//print(taylor.name)

//###############################################[11Day]#################################################
////------------------------------------------------------ protocol
//protocol Identifiable {
//    var id:String {get set} //읽기와 쓰기 설정 , get은 읽기 속성을 의미
//}
//
//struct User:Identifiable {
//    var id:String
//}
//
//func  display(thing:Identifiable) {
//    print("My ID is \(thing.id)")
//}
//
//var user = User(id: "10101010")
//display(thing: user)

////------------------------------------------------------ Protocol inheritance
//protocol Payable{
//    func calculateWages() -> Int
//}
//
//protocol NeedSTraining{
//    func study()
//}
//
//protocol HasVacation{
//    func takeVavation(days:Int)
//}
//
//protocol Employee:Payable, NeedSTraining, HasVacation {
//
//}
////------------------------------------------------------ Extensions (확장)

//extension Int {
//    func squared() -> Int {
//        return self*self
//    }
//}
//extension Int {
//    var isEven: Bool {
//        return self % 2 == 0
//    }
//}
//
//let numger = 8
//
//numger.squared()

////------------------------------------------------------ Protocol extensions (확장)
//let paythouns = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
//let beatles = Set(["John", "Paul", "George", "Ringo"])
//
//extension Collection {
//
//    func summarize() {
//        print("There are \(count) of us:")
//
//        for name in self {
//            print(name)
//        }
//    }
//}
//
//paythouns.summarize()
//beatles.summarize()


////------------------------------------------------------ Protocol-oriented programming

//protocol Identifiable { // 프로토콜에 읽고 쓸수 있는 id(스트링)변수와, identify함수가 있다.
//
//    var id: String {get set}
//    func identify()
//}
//
//extension Identifiable { // 프로토콜을 확장하고 그안에 identify함수를 정의한다.
//
//    func identify() {
//        print("My ID is \(id).")
//    }
//}
//
//struct User: Identifiable { //위에 정의한 프로토콜 타입으로 구조체를 구현한다.
//    var id: String
//}
//
//let twostraws = User(id: "twostraws")
//twostraws.identify()

//###############################################[12Day]#################################################


////------------------------------------------------------ Handling missing data

//var age: Int? = nil // 선택적 정수
//age = 38
//////------------------------------------------------------ Unwrapping optionals
//var name: String? = nil
//
//if let unwrapped = name {
//    print("\(unwrapped.count) letters")
//} else {
//    print("Missing name")
//}
//
//////------------------------------------------------------ Unwrapping with guard
//
//func greet(_ name: String?){
//    guard let unwrapped = name else {
//        print("you didn't provide a name!")
//        return
//    }
//
//    print("Hello, \(unwrapped)!")
//}

//////------------------------------------------------------ Force unwrapping
//let strnum = "5"
//let num = Int(strnum)
//
//let str = "한"
//let number = Int(str) //-> INT형으로 변경할 수 없는 경우 에러가 발생하지 않고 nil값이 나온다.
////let number = Int(str)! //-> 이렇게 하면 에러가 발생한다.

//////------------------------------------------------------ Implicitly unwrapped optionals
//var age: Int! = nil
//////------------------------------------------------------ Nil coalescing
//func username(for id: Int) -> String? {
//    if id == 1 {
//        return "Taylor Swift"
//    } else {
//        return nil
//    }
//}
//var obj = username(for: 1)
//let user = username(for: 15) ?? "Anonymous"

//////------------------------------------------------------ Optional chaining
//let names = ["John", "Paul", "George", "Ringo"]
//let beatle = names.first?.uppercased()
//////------------------------------------------------------ Optional try
enum PasswordError: Error {
    case obvious
}

//func checkPassword(_ password: String) throws -> Bool {
//    if password == "password" {
//        throw PasswordError.obvious
//    }
//
//    return true
//}
////1번째 방법
//do {
//    try checkPassword("password")
//    print("That password is good!")
//} catch {
//    print("You can't use that password.")
//}

////2번째 방법
//if let result = try? checkPassword("password") {
//    print("Result was \(result)")
//} else {
//    print("D'oh.")
//}

////3번째 방법
//try! checkPassword("sekrit")
//print("OK!")
//////------------------------------------------------------ Failable initializers

//struct Person {
//    var id: String
//
//    init?(id: String) {
//        if id.count == 9 {
//            self.id = id
//        } else {
//            return nil
//        }
//    }
//}
//
//var per = Person.init(id: "123456789")
//var str = per.self?.id;
//print(per?.id as Any)

//////------------------------------------------------------ Typecasting
//class Animal { }
//class Fish: Animal { }
//class Dog: Animal {
//    func makeNoise() {
//        print("Woof!")
//    }
//}
//
//let pets = [Fish(), Dog(), Fish(), Dog()]
//
//for pet in pets {
//    if let dog = pet as? Dog {
//        dog.makeNoise()
//    }
//}



