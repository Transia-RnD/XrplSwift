//
//  QualityUtils.swift
//  
//
//  Created by Denis Angell on 8/28/22.
//

import BigInt
import Foundation

// swiftlint:disable:next identifier_name
let BASE_TEN: Int = 10
// swiftlint:disable:next identifier_name
let ONE_BILLION: String = "1000000000"
// swiftlint:disable:next identifier_name
let TWO_BILLION: String = "2000000000"

func percentToDecimal(percent: String) throws -> String {
    if !percent.hasSuffix("%") {
        throw ValidationError.validation("Value \(percent) must end with %")
    }

    // Split the string on % and filter out any empty strings
    let split = percent.split(separator: "%").filter({ !$0.isEmpty })
    if split.count != 1 {
        throw ValidationError.unknown("Value \(percent) contains too many % signs")
    }

    return String((BigInt(split[0])! / 100), radix: BASE_TEN)
}

/**
 * Converts a string decimal to "billionths" format for use with TransferRate.
 *
 * @param decimal - A string decimal between 0 and 1.00
 * @returns A number in the "billionths" format.
 * @throws ValidationError when the parameter is not convertible to
 * "billionths" format.
 * @category Utilities
 */
public func decimalToTransferRate(decimal: String) throws -> Int {
//    let rate = new BigNumber(decimal).times(ONE_BILLION).plus(ONE_BILLION)
    let rate = BigInt(decimal)! * BigInt(ONE_BILLION)! + BigInt(ONE_BILLION)!
    if rate < BigInt(ONE_BILLION)! || rate > BigInt(TWO_BILLION)! {
        throw ValidationError.validation("Decimal value must be between 0 and 1.00.")
    }

    let billionths = String(rate, radix: BASE_TEN)

    if billionths == ONE_BILLION {
        return 0
    }

    if !billionths.isNumber {
        throw ValidationError.validation("Value is not a number")
    }

    if billionths.contains(".") {
        throw ValidationError.validation("Decimal exceeds maximum precision.")
    }

    return Int(billionths)!
}

/**
 * Converts a string percent to "billionths" format for use with TransferRate.
 *
 * @param percent - A string percent between 0% and 100%.
 * @returns A number in the "billionths" format.
 * @throws ValidationError when the percent parameter is not convertible to
 * "billionths" format.
 * @category Utilities
 */
public func percentToTransferRate(percent: String) throws -> Int {
    return try decimalToTransferRate(decimal: percentToDecimal(percent: percent))
}

/**
 * Converts a string decimal to the "billionths" format for use with QualityIn/
 * QualityOut
 *
 * @param decimal - A string decimal (i.e. ".00034").
 * @returns A number in the "billionths" format.
 * @throws ValidationError when the parameter is not convertible to
 * "billionths" format.
 * @category Utilities
 */
public func decimalToQuality(decimal: String) throws -> Int {
    let rate = BigInt(decimal)! * BigInt(ONE_BILLION)!

    let billionths = String(rate, radix: BASE_TEN)

    if !billionths.isNumber {
        throw ValidationError.validation("Value is not a number")
    }

    if billionths.contains("-") {
        throw ValidationError.validation("Cannot have negative Quality")
    }

    if billionths == ONE_BILLION {
        return 0
    }

    if billionths.contains(".") {
        throw ValidationError.validation("Decimal exceeds maximum precision.")
    }
    return Int(billionths)!
}

/**
 * Converts a quality in "billionths" format to a decimal.
 *
 * @param quality - Quality to convert to decimal.
 * @returns decimal representation of quality.
 * @throws ValidationError when quality is not convertible to decimal format.
 * @category Utilities
 */
public func qualityToDecimal(quality: Int) throws -> String {
    if !(quality is Int) {
        throw ValidationError.validation("Quality must be an integer")
    }

    if quality < 0 {
        throw ValidationError.validation("Negative quality not allowed")
    }

    if quality == 0 {
        return "1"
    }

    let decimal = BigInt(exactly: quality)! / BigInt(ONE_BILLION)!

    return String(decimal, radix: BASE_TEN)
}

/**
 * Converts a transfer rate in "billionths" format to a decimal.
 *
 * @param rate - TransferRate to convert to decimal.
 * @returns decimal representation of transfer Rate.
 * @throws ValidationError when it cannot convert from billionths format.
 * @category Utilities
 */
public func transferRateToDecimal(rate: Int) throws -> String {
    if !(rate is Int) {
        throw ValidationError.validation("Error decoding, transfer Rate must be an integer")
    }

    if rate == 0 {
        return "0"
    }

    let decimal = BigInt(exactly: rate)! - BigInt(ONE_BILLION)! / BigInt(ONE_BILLION)!

    if decimal < 0 {
        throw ValidationError.validation("Error decoding, negative transfer rate")
    }

    return String(decimal, radix: BASE_TEN)
}

/**
 * Converts a string percent to the "billionths" format for use with QualityIn/
 * QualityOut
 *
 * @param percent - A string percent (i.e. ".034%").
 * @returns A number in the "billionths" format.
 * @throws ValidationError when the percent parameter is not convertible to
 * "billionths" format.
 * @category Utilities
 */
public func percentToQuality(percent: String) throws -> Int {
    return try decimalToQuality(decimal: percentToDecimal(percent: percent))
}