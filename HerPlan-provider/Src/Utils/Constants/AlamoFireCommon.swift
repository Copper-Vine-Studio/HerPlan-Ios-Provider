//
//  AlamoFireCommon.swift
//  DemandDelivery-customer
//
//  Created by Hima on 2017-06-08.
//  Copyright © 2017 Hima. All rights reserved.
//

import Foundation
import Alamofire

struct MYError : Error {
    let description : String
    let domain : String
    
    var localizedDescription: String {
        return NSLocalizedString(description, comment: "")
    }
}
class AlamoFireCommon:  NSObject
{
    
    //MARK:- Alamofire
    //MARK:-POST Method
    class func PostURL(url: String, dict:Dictionary<String, Any> ,completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
           fullUrl =  APIURL.BASEURL + url
                headers = ["Content-Type": "application/json","authentication-token": ""]
            
            print("POST API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
            print("authentication-token: \("")")
            print("Authorization: Barear \("")")
            //set Headers
           
            
            AF.request(fullUrl, method: .post, parameters: dict, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as! NSDictionary
                        
                       
                            if Int(data["status"] as! Int) == 200
                            {
                                completion(data as! [String:AnyObject],true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {
                                completion(data as! [String:AnyObject],false,response.error ?? MYError(description: "", domain: ""))
                            }
                        
                        
                        
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error!)
                    break
                }
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false,MYError(description: "", domain: ""))
        }
    }
    //MARK:-PATCH Method
    class func PatchURL(url: String, dict:Dictionary<String, Any> ,completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
           fullUrl =  APIURL.BASEURL + url
                headers = ["Content-Type": "application/json","authentication-token": ""]
            
            print("POST API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
            print("authentication-token: \("")")
            print("Authorization: Barear \("")")
            //set Headers
           
            
            AF.request(fullUrl, method: .patch, parameters: dict, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as! NSDictionary
                        
                        
                            if Int(data["status"] as! Int) == 200
                            {
                                completion(data as! [String:AnyObject],true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {
                                completion(data as! [String:AnyObject],false,response.error ?? MYError(description: "", domain: ""))
                            }
                        
                        
                        
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error!)
                    break
                }
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false,MYError(description: "", domain: ""))
        }
    }
    class func PatchURLWithMultipart(url: String, dict:Dictionary<String, Any>, imageData: Data, imageParameter:String, isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
           fullUrl =  APIURL.BASEURL + url
                headers = ["Content-Type": "image/jpeg","authentication-token": ""]
            
            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")

            
            AF.upload(multipartFormData: { (multipartFormData) in
                
                //images
                if !imageData.isEmpty  {
                    multipartFormData.append(imageData, withName: imageParameter, fileName: "imageProfile\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                }
                
                
                
                //other params
                for (key, value) in dict {
                    if let boolvalue:Bool =  value as? Bool{
                        multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                    }
                    else if let boolvalue:Float =  value as? Float{
                        multipartFormData.append(Float(boolvalue).description.data(using: .utf8)!, withName: key)
                    }
                    else if let boolvalue:Int =  value as? Int{
                        multipartFormData.append(Int(boolvalue).description.data(using: .utf8)!, withName: key)
                    }else{
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
                //Response
            }, to: fullUrl, method: .patch, headers: headers).responseJSON(completionHandler: { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as Any as! [String:Any]
                        
                       
                            if Int(data["status"] as! Int) == 200
                            {
                                completion(data as [String:AnyObject],true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {
                                completion(data as [String:AnyObject],false,response.error ?? MYError(description: "", domain: ""))
                            }
                        
                        
                        
                        
                        
                        
                      
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error ?? MYError(description: "", domain: ""))
                    break
                }
                //upload progress
            }).uploadProgress(queue: .main, closure:  { progrss in
                print("Upload Progress: \(progrss.fractionCompleted)")
                
           
            })
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
    //MARK:-Delete Method
    class func DeleteURL(url: String, dict:Dictionary<String, Any> ,completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
           fullUrl =  APIURL.BASEURL + url
                headers = ["Content-Type": "application/json","authentication-token": ""]
            
            print("DELETE API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
            print("authentication-token: \("")")
            print("Authorization: Barear \("")")
            //set Headers
           
            
            AF.request(fullUrl, method: .delete, parameters: dict, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as! NSDictionary
                        
                       
                            if Int(data["status"] as! Int) == 200
                            {
                                completion(data as! [String:AnyObject],true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {
                                completion(data as! [String:AnyObject],false,response.error ?? MYError(description: "", domain: ""))
                            }
                        
                        
                        
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error!)
                    break
                }
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false,MYError(description: "", domain: ""))
        }
    }
  
    //MARK: GET Method
    class func GetURL(url: String, dict:Dictionary<String, Any> ,completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
            
                fullUrl =  APIURL.BASEURL + url
                 headers = ["Content-Type": "application/json","authentication-token": ""]
          
           
            if dict.count != 0 {
                fullUrl += "?"
                for (key,value) in dict {
                    fullUrl +=  "\(key)=\(value)&"
                }
                fullUrl = String(fullUrl.dropLast())
            }
            print("GET API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
                print("authentication-token: \("")")
            print("Authorization: Barear \("")")
            
            AF.request(fullUrl, method: .get, parameters: nil, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as Any as! [String:Any]
                       
                            if Int(data["status"] as! Int) == 200
                            {
                                completion(data as [String:AnyObject],true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {
                                completion(data as [String:AnyObject],false,response.error ?? MYError(description: "", domain: ""))
                            }
                        
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error! )
                    break
                }
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false,MYError(description: "", domain: ""))
        }
    }
    
    //MARK:-Upload Multipart Method
    class func PostURLWithMultipartWithoutImage(url: String, dict:Dictionary<String, Any>,  isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
           fullUrl =  APIURL.BASEURL + url
                headers = ["Content-Type": "image/jpeg","authentication-token": ""]
            
            

            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")

            
            AF.upload(multipartFormData: { (multipartFormData) in
                
              
                
                //other params
                for (key, value) in dict {
                    if let boolvalue:Bool =  value as? Bool{
                        multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                    }
                    else if let boolvalue:Float =  value as? Float{
                        multipartFormData.append(Float(boolvalue).description.data(using: .utf8)!, withName: key)
                    }
                    else if let boolvalue:Int =  value as? Int{
                        multipartFormData.append(Int(boolvalue).description.data(using: .utf8)!, withName: key)
                    }else{
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
                //Response
            }, to: fullUrl, method: .post, headers: headers).responseJSON(completionHandler: { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as Any as! [String:Any]
                        if Int(data["status"] as! Int) == 200
                        {
                            
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                        else
                        {
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error ?? MYError(description: "", domain: ""))
                    break
                }
                //upload progress
            }).uploadProgress { (progrss) in
                print("Upload Progress: \(progrss.fractionCompleted)")
                
           
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
    class func PostURLWithMultipart(url: String, dict:Dictionary<String, Any>, imageData: Data, imageParameter:String, isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            var fullUrl = ""
            var headers = HTTPHeaders()
           fullUrl =  APIURL.BASEURL + url
                headers = ["Content-Type": "image/jpeg","authentication-token": ""]
            
            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
            print("authentication-token: \("")")
        print("Authorization: Barear \("")")
            
            AF.upload(multipartFormData: { (multipartFormData) in
                
                //images
                if !imageData.isEmpty  {
                    multipartFormData.append(imageData, withName: imageParameter, fileName: "imageProfile\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                }
                
                
                
                //other params
                for (key, value) in dict {
                    if let boolvalue:Bool =  value as? Bool{
                        multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                    }
                    else if let boolvalue:Float =  value as? Float{
                        multipartFormData.append(Float(boolvalue).description.data(using: .utf8)!, withName: key)
                    }
                    else if let boolvalue:Int =  value as? Int{
                        multipartFormData.append(Int(boolvalue).description.data(using: .utf8)!, withName: key)
                    }else{
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
                //Response
            }, to: fullUrl, method: .post, headers: headers).responseJSON(completionHandler: { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as Any as! [String:Any]
                        
                       
                            if Int(data["status"] as! Int) == 200
                            {
                                completion(data as [String:AnyObject],true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {
                                completion(data as [String:AnyObject],false,response.error ?? MYError(description: "", domain: ""))
                            }
                        
                        
                        
                        
                        
                        
                      
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error ?? MYError(description: "", domain: ""))
                    break
                }
                //upload progress
            }).uploadProgress { (progrss) in
                print("Upload Progress: \(progrss.fractionCompleted)")
                
           
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
    
    
    class func PostURLWithMultiMediaMultipart(url: String, dict:Dictionary<String, Any>, imageData: [[String : Any]], imageParameter:String, isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            let fullUrl = APIURL.BASEURL + url
            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
                        print("authentication-token: \("")")
            //set Headers
            let headers: HTTPHeaders = ["Content-Type": "image/jpeg","authentication-token": ""]
            
            AF.upload(multipartFormData: { (multipartFormData) in
                
                //images
                
                for aimageData in imageData{
                    
                    multipartFormData.append( aimageData["data"] as! Data, withName: (aimageData["filename"] as! String).count == 0 ?  "media" : (aimageData["filename"] as! String) , fileName: (aimageData["filename"] as! String).count == 0 ?  "image.jpg" : (aimageData["filename"] as! String), mimeType: "image/jpg")
                    
                    
                }
                
                
                
                //other params
                for (key, value) in dict {
                    if let boolvalue:Bool =  value as? Bool{
                        multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                    } else if let intvalue:Int =  value as? Int{
                        multipartFormData.append(Int(intvalue).description.data(using: .utf8)!, withName: key)
                        
                    }
                    else if let Json : [String ] =  value as? [String]{
                        
                        let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                        multipartFormData.append(arrData, withName: key as String)
                        
                    }
                    else if let Json : [[String : Any]] =  value as? [[String : Any]]{
                        
                        let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                        multipartFormData.append(arrData, withName: key as String)
                        
                    } else if let Json :  [String : Any] =  value as?  [String : Any]{
                        
                        let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                        multipartFormData.append(arrData, withName: key as String)
                    }
                    else {
                        
                        multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue))!, withName: key)
                    }
                }
                //Response
            }, to: fullUrl, method: .post, headers: headers).responseJSON(completionHandler: { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        let data = response.value! as Any as! [String:Any]
                        if Int(data["status"] as! Int) == 200
                        {
                            
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                        else
                        {
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                    }
                    break
                case .failure(_):
                    print(response.error!)
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error ?? MYError(description: "", domain: ""))
                    break
                }
                //upload progress
            }).uploadProgress { (progrss) in
                print("Upload Progress: \(progrss.fractionCompleted)")
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
   
    //MARK:-Upload Multipart Method
    class func PostURLWithMultipartVideo(url: String, dict:Dictionary<String, Any>, imageData: Data, imageParameterName:String, videoData: Data, videoParameterName:String, isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            let fullUrl = APIURL.BASEURL + url
            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
                        print("authentication-token: \("")")
            //set Headers
            let headers: HTTPHeaders = ["Content-Type": "image/jpeg","authentication-token": ""]

            
            AF.upload(multipartFormData: { (multipartFormData) in
                
                //images
                if imageData.count != 0{
                    multipartFormData.append(imageData, withName: imageParameterName, fileName: "imageProfile\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                }
               
                
                //Video
                if videoData.count != 0{
                     multipartFormData.append(videoData, withName: videoParameterName, fileName: "video\(Date().timeIntervalSince1970).mp4", mimeType: "video/mp4")
                }
                //other params
              
                    //other params
                    for (key, value) in dict {
                        if let boolvalue:Bool =  value as? Bool{
                            
                            multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                            
                        } else if let intvalue:Int =  value as? Int{
                            multipartFormData.append(Int(intvalue).description.data(using: .utf8)!, withName: key)
                            
                        }
                        else if let Json : [String] =  value as? [String]{
                            
                            let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                            multipartFormData.append(arrData, withName: key as String)
                            
                        }
                        else if let Json : [[String : Any]] =  value as? [[String : Any]]{
                            
                            let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                            multipartFormData.append(arrData, withName: key as String)
                            
                        } else if let Json :  [String : Any] =  value as?  [String : Any]{
                            
                            let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                            multipartFormData.append(arrData, withName: key as String)
                        }
                        else {
                            
                            multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue))!, withName: key)
                        }
                    }
                
                //Response
            }, to: fullUrl, method: .post, headers: headers).responseJSON(completionHandler: { (response) in
                switch response.result
                {
                case .success(_):
                    

                    
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        
                        
                        let data = response.value! as Any as! [String:Any]
                        if Int(data["status"] as! Int) == 200
                        {

                            
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                        else
                        {

                            
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                    }
                    break
                case .failure(_):
                    print(response.error!)
  
                    
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error ?? MYError(description: "", domain: ""))
                    break
                }
                //upload progress
            }).uploadProgress { (progrss) in
                
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
    class func PostURLWithMultipartVideoNewAnswer(url: String, dict:Dictionary<String, Any>, imageData: Data, imageParameterName:String, videoData: Data, videoParameterName:String, isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
             // global variable
//            var backgroundTask: UIBackgroundTaskIdentifier?
//               backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "backgroundTask") {
//                   // Cleanup code should be written here so that you won't see the loader
//
//                   UIApplication.shared.endBackgroundTask(sbackgroundTask!)
//                backgroundTask = UIBackgroundTaskIdentifier.invalid
//               }
            
            let fullUrl = APIURL.BASEURL + url
            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
                        print("authentication-token: \("")")
            //set Headers
            let headers: HTTPHeaders = ["Content-Type": "image/jpeg","authentication-token": ""]
  
            

   
                AF.upload(multipartFormData: { (multipartFormData) in
                    
                    //images
                    if imageData.count != 0{
                        multipartFormData.append(imageData, withName: imageParameterName, fileName: "imageProfile\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                    }
                   
                    
                    //Video
                    if videoData.count != 0{
                         multipartFormData.append(videoData, withName: videoParameterName, fileName: "video\(Date().timeIntervalSince1970).mp4", mimeType: "video/mp4")
                    }
                    //other params
                  
                        //other params
                        for (key, value) in dict {
                            if let boolvalue:Bool =  value as? Bool{
                                
                                multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                                
                            } else if let intvalue:Int =  value as? Int{
                                multipartFormData.append(Int(intvalue).description.data(using: .utf8)!, withName: key)
                                
                            }
                            else if let Json : [String] =  value as? [String]{
                                
                                let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                                multipartFormData.append(arrData, withName: key as String)
                                
                            }
                            else if let Json : [[String : Any]] =  value as? [[String : Any]]{
                                
                                let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                                multipartFormData.append(arrData, withName: key as String)
                                
                            } else if let Json :  [String : Any] =  value as?  [String : Any]{
                                
                                let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                                multipartFormData.append(arrData, withName: key as String)
                            }
                           
                            
                            else {
                                
                                multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue))!, withName: key)
                            }
                        }
                    
                    //Response
                }, to: fullUrl, method: .post, headers: headers).responseJSON(  completionHandler: { (response) in
                    switch response.result
                    {
                    case .success(_):
        
                        
                        
                  
                        
                        if response.value != nil
                        {
                            print(response.value as! NSDictionary)
                            
                            
                            let data = response.value! as Any as! [String:Any]
                            if Int(data["status"] as! Int) == 200
                            {
                                
                                
                                completion(data,true,response.error ?? MYError(description: "", domain: ""))
                            }
                            else
                            {

                                
                                completion(data,true,response.error ?? MYError(description: "", domain: ""))
                            }
                        }
                        break
                    case .failure(_):
                        print(response.error!)
   
                        break
                    }
                    //upload progress
                }).uploadProgress { (progrss) in
                
                   
                    
                    print("Upload Progress: \(progrss.fractionCompleted)")
                }
            
           
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
    //MARK:-Upload Multipart Method
    class func PostURLWithMultipartVideoOrImage(url: String, dict:Dictionary<String, Any>, imageData: Data, imageParameterName:String, videoData: Data, videoParameterName:String, isAuth: Bool, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool, _ error: Error) -> (), uploadProgress: @escaping(_ uploadCount: Float) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            let fullUrl = APIURL.BASEURL + url
            print("MALTIPART API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
                        print("authentication-token: \("")")
            //set Headers
            let headers: HTTPHeaders = ["Content-Type": "image/jpeg","authentication-token": ""]
           
             
            
            AF.upload(multipartFormData: { (multipartFormData) in
                
                //images
                if imageData.count != 0{
                    multipartFormData.append(imageData, withName: imageParameterName, fileName: "imageProfile\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                }
               
                
                //Video
                if videoData.count != 0{
                     multipartFormData.append(videoData, withName: videoParameterName, fileName: "video\(Date().timeIntervalSince1970).mp4", mimeType: "video/mp4")
                }
                //other params
              
                    //other params
                    for (key, value) in dict {
                        if let boolvalue:Bool =  value as? Bool{
                            
                            multipartFormData.append(Bool(boolvalue).description.data(using: .utf8)!, withName: key)
                            
                        } else if let intvalue:Int =  value as? Int{
                            multipartFormData.append(Int(intvalue).description.data(using: .utf8)!, withName: key)
                            
                        }
                        else if let Json : [String] =  value as? [String]{
                            
                            let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                            multipartFormData.append(arrData, withName: key as String)
                            
                        }
                        else if let Json : [[String : Any]] =  value as? [[String : Any]]{
                            
                            let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                            multipartFormData.append(arrData, withName: key as String)
                            
                        } else if let Json :  [String : Any] =  value as?  [String : Any]{
                            
                            let arrData =  try! JSONSerialization.data(withJSONObject: Json, options: .prettyPrinted)
                            multipartFormData.append(arrData, withName: key as String)
                        }
                        else {
                            
                            multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue))!, withName: key)
                        }
                    }
                
                //Response
            }, to: fullUrl, method: .post, headers: headers).responseJSON(completionHandler: { (response) in
                switch response.result
                {
                case .success(_):
                    
                    
                    

                    
                    
               
                    
                    if response.value != nil
                    {
                        print(response.value as! NSDictionary)
                        
                        
                        let data = response.value! as Any as! [String:Any]
                        if Int(data["status"] as! Int) == 200
                        {
                            
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                        else
                        {
                            completion(data,true,response.error ?? MYError(description: "", domain: ""))
                        }
                    }
                    break
                case .failure(_):
                    print(response.error!)
              
                    
                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? AlertTitleMessage.ERROR, forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false,response.error ?? MYError(description: "", domain: ""))
                    break
                }
                //upload progress
            }).uploadProgress { (progrss) in
                
                uploadProgress(Float(progrss.fractionCompleted))
                
                
            }
        }
        else
        {
            let temp=NSDictionary.init(object: AlertTitleMessage.INTERNET_ERROR, forKey: "message" as NSCopying)
            completion(temp as! Dictionary<String, Any>,false, MYError(description: "", domain: ""))
        }
    }
    
   
}

