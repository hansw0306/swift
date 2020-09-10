//
//  NativeFunc.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/05.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import SQLite3


// https://github.com/marmelroy/Zip
// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html
//생체 인식에 필요
import LocalAuthentication

class NativeFuc: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    typealias MobileLibraryResult = (NSObject?) -> Void
    
    //MARK:- 화면관련
     
    //MARK:0. 최상위 viewController
    var topNativeViewCon = UIViewController.init()
    
    
    func topViewCon() -> UIViewController? {
        
        if let keyWindow = UIApplication.shared.keyWindow{
            if var viewController = keyWindow.rootViewController{
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                print("[topViewCon] : \(String(describing:viewController))")
                topNativeViewCon = viewController
                return viewController
            }
        }
        return nil
    }
    
    
    //MARK:1 스토리 보드내의 Viwe 이동함수
    func XibViewMove (storyboard:UIStoryboard ,viewName: String)
    {
        let viewController = UIApplication.shared.windows.first!.rootViewController as! ViewController
        let controller = storyboard.instantiateViewController(withIdentifier: viewName)
        viewController.navigationController?.pushViewController(controller, animated: true)

    }
    //MARK:2 스토리 보드 밖에 있는 View 이동함수
    func ExXibViewMove(viewCont : UIViewController, overFullScreen: Bool) {
        //let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        
        let viewController = UIApplication.shared.windows.first!.rootViewController as! ViewController
        //modalPresentationStyle는 .overFullScreen
        if overFullScreen{
            viewCont.modalPresentationStyle = UIModalPresentationStyle(rawValue: 5)!;
        }
        viewController.present(viewCont, animated: true, completion: nil)
        
    }
    
    //MARK:3 이전화면으로 가기
    func back( mViewCon : UIViewController) {
        if mViewCon.presentingViewController != nil {
            mViewCon.dismiss(animated: true, completion: nil)
        } else {
            mViewCon.navigationController?.popViewController(animated: true)
        }
    }
    
    
    //MARK: 현제의 화면에서 사이드메뉴 화면 띄우기
    func leftShowView(storyboard:UIStoryboard, presentVC:UIViewController ) {
            // 사이드 메뉴 띄우기
            let sidemenuVC = storyboard.instantiateViewController(withIdentifier: "SidemenuVC") as! SidemenuViewController
            presentVC.addChild(sidemenuVC)
            sidemenuVC.view.frame = presentVC.view.frame
            presentVC.view.addSubview(sidemenuVC.view)
            sidemenuVC.didMove(toParent: presentVC)
    }
    
    
    //MARK: Alet뷰 작업
    func showAlet(type:NSString, title:String, msg:String, viewCon:UIViewController?) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        if (type == "YES/NO")
        {
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        }
        else
        {
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        }
        
        //화면 표시
           viewCon?.present(alert, animated: true)
    }
    
    
    //MARK:-
    //MARK:네이티브 기능 호출 부분
    
//------------------------------------------------------------------------------
    //카메라 앨범관련 객체
        let picker = UIImagePickerController()
    
//------------------------------------------------------------------------------
    
    //MARK:1. 생체 인식 (리턴 부분 테스트 해야함)
    func OpenBioAuth(callBack:@escaping(String)->Void) {
        // LAContext Instance creation
        let authContext = LAContext()
        
        // Error store variable
        var error: NSError?
        
        // Check if the device has finger print sensor
        guard authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            //생체인식 안되는 장치 처리
            //print("\(String(describing: error))")
            
            //1> 생체인식을 사용할 수 없는 기기일때
            //2> 설정에서 암호를 끄고 있을때
            callBack("\(String(describing: error))")
            return
        }
        
        authContext.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: "홈 버튼에 손가락을 올려주세요.",
                                   reply: { success, error in
            if success {
                // Fingerprint recognized
                //print("지문인증 성공 or 암호인증 성공")
                callBack("Success")
            }
            else {
                if let error = error {
                    print(error.localizedDescription)
                    //print("에러")
                    callBack("Error:\(error.localizedDescription)")
                }
                print("취소")
                callBack("Cancel")
            }
        })
    }
    
//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---
    typealias CustomType = String
    var customString:CustomType = "Test String"
    
    func xxx() -> CustomType {
        CustomType("한상원")
    }
    typealias closureType = (NSString, NSError?) ->Void
    //let completionBlock:closureType = {strg,error in  //do something}
    
//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---//---
    
    
    
    

    //MARK:2. 카메라
    func OpenCamera() {
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        self.topViewCon()?.present(picker, animated: true)
    }
    
    
    //MARK:3. 앨범
    func OpenAlbum() {
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.topViewCon()?.present(picker, animated: true)
    }
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)

            guard let image = info[.editedImage] as? UIImage else {
                print("No image found")
                return
            }
            // print out the image size as a test
            //print(image.size)
            
            var documentsUrl: URL {
                return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            }
            var fileName = "image.png"
            let imageUrlPath = documentsUrl.appendingPathComponent(fileName)
            //let url = NSURL(string: "Path")
            //let data = NSData(contentsOf: url! as URL)
            do {
                 // note it runs in current thread
                let imagedata = try Data(contentsOf:imageUrlPath, options: [.alwaysMapped , .uncached ] )

                if let imageSource = CGImageSourceCreateWithData(imagedata as CFData, nil)
                {
                  if let dictionary = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) {
                    print(dictionary)
                  }
                }

            }
            catch {

                print(error)
            }
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
        {
            print("Camera Cancel")
            topNativeViewCon.dismiss(animated: true, completion: nil)
        }
    
    //MARK:3. 설정화면 띄우기
    func OpenSetting() {
        
        let authAlertController : UIAlertController
        let GetAuthAction : UIAlertAction
        
        //얼랏컨트롤 작업
        authAlertController = UIAlertController(title: "권한체크", message: "설정화면으로 이동하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        

        //확인버튼을 눌렀을때 처리할 동작
        GetAuthAction = UIAlertAction(title: "설정화면 이동", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            if let appSettings = URL(string: UIApplication.openSettingsURLString){
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(appSettings,options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    UIApplication.shared.openURL(appSettings)
                    
                }
            }
        })
        authAlertController.addAction(GetAuthAction)
        self.topViewCon()?.present(authAlertController, animated: true, completion: nil)
    }

    //MARK:-
    //MARK:기능관련
    
    //MARK:1. saveValue loadValue removeValue
    let myUserDefaults = UserDefaults.standard
    func saveValue(value:String,key:String) {
        myUserDefaults.set(value, forKey: key)
        myUserDefaults.synchronize()
    }
    
    func loadValue(key:String)->String {
        
        return myUserDefaults.string(forKey: key)!
    }
    
    func removeValue(key:String) {
        myUserDefaults.removeObject(forKey: key)
    }
    
    
    //MARK:2. 탈옥체크
    //결과가 true이면 탈옥된 디바이스 이다.
     func getJailbrokenStatus() -> Bool {
        if TARGET_IPHONE_SIMULATOR != 1 {
            // Check 1 : existence of files that are common for jailbroken devices
            if FileManager.default.fileExists(atPath: "/Applications/Cydia.app")
                || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib")
                || FileManager.default.fileExists(atPath: "/bin/bash")
                || FileManager.default.fileExists(atPath: "/Applications/Icy.app")
                || FileManager.default.fileExists(atPath: "/usr/sbin/sshd")
                || FileManager.default.fileExists(atPath: "/etc/apt")
                || FileManager.default.fileExists(atPath: "/private/var/lib/apt/")
                || UIApplication.shared.canOpenURL(URL(string:"cydia://package/com.example.package")!) {
                return true
            }
            // Check 2 : Reading and writing in system directories (sandbox violation)
            let stringToWrite = "Jailbreak Test"
            do {
                try stringToWrite.write(toFile:"/private/JailbreakTest.txt", atomically:true, encoding:String.Encoding.utf8)
                //Device is jailbroken
                return true
            } catch {
                return false
            }
        }
        else {
            return false
        }
    }
    
    //MARK:3. 디레토리 생성, 삭제, 존재유무확인
    func CreateDirectory(drectoryName:String) -> Bool {
        
        //로컬 RootDirectory 주소가져오기
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        let docsURL = dirPaths[0]
        //생성할 디릭토리 주소
        let newDir = docsURL.appendingPathComponent(drectoryName).path

        //해당파일이 존재하지 않을 경우에만 생성하도록 하자
        if !filemgr.fileExists(atPath: newDir)
        {
            do{
                try filemgr.createDirectory(atPath: newDir,withIntermediateDirectories: true, attributes: nil)
                
                //. withIntermediateDirectories : 생성 디렉터리의 부모 디렉터리가 존재하지 않을 경우 생성 여부
                //. attributes : 디렉터리 속성 객체(NSDictionary), nil일 경우 default값 저장
                //. 성공여부 반환. withIntermediateDirectories값이 fales일 때 부모 디렉터리가 존재하지 않을 경우에도 false 반환.
                
            } catch {
                print("Error: \(error.localizedDescription)")
                return false
            }
        }
        return true
    }
    
    func DeleteDirectory(drectoryName:String) -> Bool {
        
        //로컬 RootDirectory 주소가져오기
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        let docsURL = dirPaths[0]
        //생성할 디릭토리 주소
        let newDir = docsURL.appendingPathComponent(drectoryName).path

        return filemgr.isDeletableFile(atPath: newDir)
    }
    
    //디렉토리 내 파일 목록정보 추출
    func listFilesFromDocumentsFolder() -> [String]?
    {
        let fileMngr = FileManager.default;

        // Full path to documents directory
        let docs = fileMngr.urls(for: .documentDirectory, in: .userDomainMask)[0].path

        // List all contents of directory and return as [String] OR nil if failed
        return try? fileMngr.contentsOfDirectory(atPath:docs)
    }
    
    
    //MARK:4. project에 있는 파일들의 목록을 입력하여 앱을 최초 실행할 경우에만 앱 로컬에 copy
    func ProjectFileInDocuments(fileNames:Array<Any>)  {
        if UserDefaults.standard.bool(forKey: "firstLaunch") == false {
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            UserDefaults.standard.synchronize()
            let fileManager = FileManager.default
            //let fileNames = ["index.html"]
            let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
            let bundleUrl = Bundle.main.resourceURL
            
            for file in fileNames {
                
                if let srcPath = bundleUrl?.appendingPathComponent(file as! String).path{
                    let toPath = documentsUrl.appendingPathComponent(file as! String).path
                    do {
                        try fileManager.copyItem(atPath: srcPath, toPath: toPath)
                    } catch {}
                }
            }
        }
    }
    
    
    
    
    //MARK:10. 비동기 처리
    func Asynchronous()  {
        
        //비동기 처리1 GCD
        DispatchQueue.main.async {
            //내부적으로 스레드에 직접 겁근 없이 비동기 처리
        }
        
        //비동기 처리2
        OperationQueue().addOperation{
            //다른 스레드에서 아래의 로직을 처림함 (비동기)
            self.download()
        }
        OperationQueue.main.addOperation {
            //메인스레드에서 처리
        }
        
        
        //설명 및 테스트
        DispatchQueue.global().sync { print("1") }
        print("2")
        DispatchQueue.global().sync {
            sleep(2)
            print("3")
        }
        DispatchQueue.main.async { print("4") }
        DispatchQueue.global(qos: .background).async { print("5") }
        DispatchQueue.global(qos: .userInteractive).async { print("6") }
        print("7")
        
        /*
          sync는 작업이 끝나야 return
          async는 작업을 전달하자마자 return
         "1" 무조건 1등으로 출력된다. 왜냐면 sync로 추가했기 때문에 1이 출력되기 전까지 다음문장으로 넘어가지 않는다.
         "2" 무조건 1다음으로 출력된다.
         "3" "2"가 출력된 뒤, 2초 뒤에 출력된다. (만약에 sync가 아닌 async였다면 "3"은 무조건!! 꼴지로 출력된다.)
         "4" 5와 6과의 관계는 알 수 없지만 확실한건 "7"보다는 늦게 출력된다. 왜냐하면 "4"를 메인스레드에 추가하기 전에 "7"을 출력하는 작업이 이미 추가되어 있고, 메인스레드는 Serial큐이기 때문이다.
         "5", "6" 서로 다른 Concurrent큐에 async로 추가되었다. 따라서, 출력되는 순서는 장담할 수 없다.
         "7" 3보다는 늦게 출력되고 4보다는 먼저 출력된다. 무조건!!
         */
        
    }

    func download(){
    guard let url : URL = URL.init(string: "https://www.google.co.kr/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png") else {
        return
    }
    var imageData:Data
    do {
        imageData = try Data.init(contentsOf:url)
    } catch  {
        return
    }
    let image: UIImage = UIImage(data: imageData)!
    print(image)
    }
    
}
//MARK:- Another Class

//MARK: 메일 보내기
class MyPageViewController: UIViewController , MFMailComposeViewControllerDelegate{
    
    func sentMail(viewCon:UIViewController) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            viewCon.present(mailComposeViewController, animated: true, completion: nil)
            print("can send mail")
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["hansw0306@gmail.com"])
        mailComposerVC.setSubject("한상원 IOS 문의 메일")
        mailComposerVC.setMessageBody("여러분의 소중한 의견 감사드립니다. \n - 한상원 -", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", delegate: self, cancelButtonTitle: "확인")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
