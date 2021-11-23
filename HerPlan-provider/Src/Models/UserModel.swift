//
//  UserModel.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation

// MARK: - Login Model
struct UserDataLogin: Codable
{
    var aboutSelf, accountStatus, bankId, countryCode, countryId, address, city, stateId, zipCode, dateOfBirth, deviceToken, email, fb_connect_id, fullName, google_connect_id, image, isEmailNotify, isLicenseAvailable, isMessageNotify, isMobileVerify, isProfileAvailable, isAddressAdded, isBankDetailAdded, isUserAvailable, joiningDate, language, loginToken, mobileNo, otp, roleId, schoolName, social_id, social_media_type, stripeAccountId, stripeId, userId, verified, workAddress, vendorRating, isLicenseVerify, wallet_amount, referral_code, referral_code_amount, isVehicleAdded, isInsuranceAdded, multiStepStatus, isDriverVerify, isDriverAvailable, icon : String
    
    enum CodingKeys: String, CodingKey
    {
        case aboutSelf
        case accountStatus
        case address
        case bankId
        case city
        case countryCode
        case countryId
        case stateId
        case dateOfBirth
        case deviceToken
        case email
        case fb_connect_id
        case fullName
        case google_connect_id
        case image
        case isEmailNotify
        case isLicenseAvailable
        case isMessageNotify
        case isMobileVerify
        case isProfileAvailable
        case isAddressAdded
        case isBankDetailAdded
        case isUserAvailable
        case joiningDate
        case language
        case loginToken
        case mobileNo
        case otp
        case roleId
        case schoolName
        case social_id
        case social_media_type
        case stripeAccountId
        case stripeId
        case userId
        case verified
        case workAddress
        case zipCode
        case vendorRating
        case isLicenseVerify
        case wallet_amount
        case referral_code
        case referral_code_amount
        case isVehicleAdded
        case isInsuranceAdded
        case multiStepStatus
        case isDriverVerify
        case isDriverAvailable
        case icon
    }
}

struct UserData: Codable
{
    var aboutSelf, accountStatus, bankId, countryCode, countryId, address, city, stateId, zipCode, dateOfBirth, deviceToken, email, fb_connect_id, fullName, google_connect_id, image, isEmailNotify, isLicenseAvailable, isMessageNotify, isMobileVerify, isProfileAvailable, isAddressAdded, isBankDetailAdded, isUserAvailable, joiningDate, language, loginToken, mobileNo, otp, roleId, schoolName, social_id, social_media_type, stripeAccountId, stripeId, userId, verified, workAddress, vendorRating, isLicenseVerify, wallet_amount, referral_code, referral_code_amount : String

    enum CodingKeys: String, CodingKey
    {
        case aboutSelf
        case accountStatus
        case address
        case bankId
        case city
        case countryCode
        case countryId
        case stateId
        case dateOfBirth
        case deviceToken
        case email
        case fb_connect_id
        case fullName
        case google_connect_id
        case image
        case isEmailNotify
        case isLicenseAvailable
        case isMessageNotify
        case isMobileVerify
        case isProfileAvailable
        case isAddressAdded
        case isBankDetailAdded
        case isUserAvailable
        case joiningDate
        case language
        case loginToken
        case mobileNo
        case otp
        case roleId
        case schoolName
        case social_id
        case social_media_type
        case stripeAccountId
        case stripeId
        case userId
        case verified
        case workAddress
        case zipCode
        case vendorRating
        case isLicenseVerify
        case wallet_amount
        case referral_code
        case referral_code_amount
    }
}
