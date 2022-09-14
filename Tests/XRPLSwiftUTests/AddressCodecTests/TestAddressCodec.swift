//
//  TestAddressCodec.swift
//  
//
//  Created by Denis Angell on 7/2/22.
//

import XCTest
@testable import XRPLSwift

final class TestUAddressCodec: XCTestCase {

    public static let testCases = [
        [
            "r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59",
            false,
            "X7AcgcsBL6XDcUb289X4mJ8djcdyKaB5hJDWMArnXr61cqZ",
            "T719a5UwUCnEs54UsxG9CJYYDhwmFCqkr7wxCcNcfZ6p5GZ"
        ],
        [
            "r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59",
            1,
            "X7AcgcsBL6XDcUb289X4mJ8djcdyKaGZMhc9YTE92ehJ2Fu",
            "T719a5UwUCnEs54UsxG9CJYYDhwmFCvbJNZbi37gBGkRkbE"
        ],
        [
            "r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59",
            14,
            "X7AcgcsBL6XDcUb289X4mJ8djcdyKaGo2K5VpXpmCqbV2gS",
            "T719a5UwUCnEs54UsxG9CJYYDhwmFCvqXVCALUGJGSbNV3x"
        ],
        [
            "r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59",
            11747,
            "X7AcgcsBL6XDcUb289X4mJ8djcdyKaLFuhLRuNXPrDeJd9A",
            "T719a5UwUCnEs54UsxG9CJYYDhwmFCziiNHtUukubF2Mg6t"
        ],
        [
            "rLczgQHxPhWtjkaQqn3Q6UM8AbRbbRvs5K",
            false,
            "XVZVpQj8YSVpNyiwXYSqvQoQqgBttTxAZwMcuJd4xteQHyt",
            "TVVrSWtmQQssgVcmoMBcFQZKKf56QscyWLKnUyiuZW8ALU4"
        ],
        [
            "rpZc4mVfWUif9CRoHRKKcmhu1nx2xktxBo",
            false,
            "X7YenJqxv3L66CwhBSfd3N8RzGXxYqPopMGMsCcpho79rex",
            "T77wVQzA8ntj9wvCTNiQpNYLT5hmhRsFyXDoMLqYC4BzQtV"
        ],
        [
            "rpZc4mVfWUif9CRoHRKKcmhu1nx2xktxBo",
            58,
            "X7YenJqxv3L66CwhBSfd3N8RzGXxYqV56ZkTCa9UCzgaao1",
            "T77wVQzA8ntj9wvCTNiQpNYLT5hmhR9kej6uxm4jGcQD7rZ"
        ],
        [
            "rsA2LpzuawewSBQXkiju3YQTMzW13pAAdW",
            23480,
            "X7d3eHCXzwBeWrZec1yT24iZerQjYL8m8zCJ16ACxu1BrBY",
            "T7YChPFWifjCAXLEtg5N74c7fSAYsvSokwcmBPBUZWhxH5P"
        ],
        [
            "rsA2LpzuawewSBQXkiju3YQTMzW13pAAdW",
            11747,
            "X7d3eHCXzwBeWrZec1yT24iZerQjYLo2CJf8oVC5CMWey5m",
            "T7YChPFWifjCAXLEtg5N74c7fSAYsvTcc7nEfwuEEvn5Q4w"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            false,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtV5fdx1mHp98tDMoQXb",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQn49b3qD26PK7FcGSKE"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            0,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtV8AqEL4xcZj5whKbmc",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnSy8RHqGHoGJ59spi2"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            1,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtV8xvjGQTYPiAx6gwDC",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnSz1uDimDdPYXzSpyw"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            2,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtV8zpDURx7DzBCkrQE7",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnTryP9tG9TW8GeMBmd"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            32,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtVoYiC9UvKfjKar4LJe",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnT2oqaCDzMEuCDAj1j"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            276,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtVoKj3MnFGMXEFMnvJV",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnTMgJJYfAbsiPsc6Zg"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            65591,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtVozpjdhPQVdt3ghaWw",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQn7ryu2W6njw7mT1jmS"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            16781933,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtVqrDUk2vDpkTjPsY73",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnVsw45sDtGHhLi27Qa"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            4294967294,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtV1kAsixQTdMjbWi39u",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnX8tDFQ53itLNqs6vU"
        ],
        [
            "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf",
            4294967295,
            "XVLhHMPHU98es4dbozjVtdWzVrDjtV18pX8yuPT7y4xaEHi",
            "TVE26TYGhfLC7tQDno7G8dGtxSkYQnXoy6kSDh6rZzApc69"
        ],
        [
            "rPEPPER7kfTD9w2To4CQk6UCfuHM9c6GDY",
            false,
            "XV5sbjUmgPpvXv4ixFWZ5ptAYZ6PD2gYsjNFQLKYW33DzBm",
            "TVd2rqMkYL2AyS97NdELcpeiprNBjwLZzuUG5rZnaewsahi"
        ],
        [
            "rPEPPER7kfTD9w2To4CQk6UCfuHM9c6GDY",
            0,
            "XV5sbjUmgPpvXv4ixFWZ5ptAYZ6PD2m4Er6SnvjVLpMWPjR",
            "TVd2rqMkYL2AyS97NdELcpeiprNBjwRQUBetPbyrvXSTuxU"
        ],
        [
            "rPEPPER7kfTD9w2To4CQk6UCfuHM9c6GDY",
            13371337,
            "XV5sbjUmgPpvXv4ixFWZ5ptAYZ6PD2qwGkhgc48zzcx6Gkr",
            "TVd2rqMkYL2AyS97NdELcpeiprNBjwVUDvp3vhpXbNhLwJi"
        ]
    ]

    func testClassicAddressToXaddress() {
        for testCase in TestUAddressCodec.testCases {
            let classicAddress: String = testCase[0] as! String
            let tag: Int? = testCase[1] as? Int ?? nil
            let expectedMainXaddress: String = testCase[2] as! String
            let expectedTestXaddress: String = testCase[3] as! String

            do {
                // test
                let xAddressTest: String = try AddressCodec.classicAddressToXAddress(
                    classicAddress: classicAddress,
                    tag: (tag != nil) ? UInt32(tag!) : nil,
                    isTest: true
                )
                XCTAssert(xAddressTest == expectedTestXaddress)

                // main
                let xAddressMain: String = try AddressCodec.classicAddressToXAddress(
                    classicAddress: classicAddress,
                    tag: (tag != nil) ? UInt32(tag!) : nil,
                    isTest: false
                )
                XCTAssert(xAddressMain == expectedMainXaddress)
            } catch {
                print(error.localizedDescription)
                XCTFail("Could not convert classic address to x address")
            }
        }
    }

    func testXAddressToClassicAddress() {
        for testCase in TestUAddressCodec.testCases {
            let classicAddress: String = testCase[0] as! String
//            let tag: UInt32? = testCase[1] as? UInt32 ?? nil
            let expectedMainXaddress: String = testCase[2] as! String
            let expectedTestXaddress: String = testCase[3] as! String

            do {
                // test
                let testResult = try AddressCodec.xAddressToClassicAddress(
                    xAddress: expectedTestXaddress
                )
                let classicAddressTest = testResult["classicAddress"] as? String
                XCTAssert(classicAddressTest == classicAddress)

                // main
                let mainResult = try AddressCodec.xAddressToClassicAddress(
                    xAddress: expectedMainXaddress
                )
                let classicAddressMain = mainResult["classicAddress"] as? String
                XCTAssert(classicAddressMain == classicAddress)
            } catch {
                print(error.localizedDescription)
                XCTFail("Could not convert classic address to x address")
            }
        }
    }

    // MARK: NOT VALID SWIFT IMPLEMENTATION
    // Notes: Tag is a UInt32. Swift will reject the UInt32 if "out of bounds"
//    func testClassicAddressToXaddressInvalidTag() {
//        let classicAddress = "rGWrZyQqhTp9Xu7G5Pkayo7bXjH4k4QYpf"
//        let tag = MAX_32_BIT_UNSIGNED_INT + 1
//        do {
//            _ = try AddressCodec.classicAddressToXAddress(
//                classicAddress: classicAddress,
//                tag: UInt32(tag),
//                isTest: true
//            )
//        } catch {
//            XCTAssertTrue(error is AddressCodecError, "Unexpected error type: \(type(of: error))")
//        }
//        do {
//            _ = try AddressCodec.classicAddressToXAddress(
//                classicAddress: classicAddress,
//                tag: UInt32(tag),
//                isTest: false
//            )
//        } catch {
//            XCTAssertTrue(error is AddressCodecError, "Unexpected error type: \(type(of: error))")
//        }
//    }

    // MARK: NOT VALID SWIFT IMPLEMENTATION
//    func testClassicAddressToXaddressBadClassicAddress() {
//        let classicAddress = "r"
//        do {
//            _ = try AddressCodec.classicAddressToXAddress(
//                classicAddress: classicAddress,
//                isTest: true
//            )
//        } catch {
//            XCTAssertTrue(error is AddressCodecError, "Unexpected error type: \(type(of: error))")
//        }
//        do {
//            _ = try AddressCodec.classicAddressToXAddress(
//                classicAddress: classicAddress,
//                isTest: false
//            )
//        } catch {
//            XCTAssertTrue(error is AddressCodecError, "Unexpected error type: \(type(of: error))")
//        }
//    }

    func testConvertIsTest() {
        let classicAddress = "r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59"
        let tag = 0
        let xaddress = "X7AcgcsBL6XDcUb289X4mJ8djcdyKaB5hJDWMArnXr61cqZ"
        let result = try! AddressCodec.classicAddressToXAddress(classicAddress: classicAddress, tag: UInt32(tag), isTest: false)
        XCTAssertEqual(result, xaddress)
    }

    func testIsValidClassicAddressSecp256k1() {
        let classicAddress = "rU6K7V3Po4snVhBBaU29sesqs2qTQJWDw1"
        let result = XrplCodec.isValidClassicAddress(classicAddress: classicAddress)
        XCTAssertTrue(result)
    }

    func testIsValidClassicAddressEd25519() {
        let classicAddress = "rLUEXYuLiQptky37CqLcm9USQpPiz5rkpD"
        let result = XrplCodec.isValidClassicAddress(classicAddress: classicAddress)
        XCTAssertTrue(result)
    }

    func testIsValidClassicAddressInvalid() {
        let classicAddress = "rU6K7V3Po4snVhBBaU29sesqs2qTQJWDw2"
        let result = XrplCodec.isValidClassicAddress(classicAddress: classicAddress)
        XCTAssertFalse(result)
    }

    func testIsValidXAddress() {
        let xAddress = "X7AcgcsBL6XDcUb289X4mJ8djcdyKaB5hJDWMArnXr61cqZ"
        let result = AddressCodec.isValidXAddress(xAddress: xAddress)
        XCTAssertTrue(result)
    }

    func testIsValidXAddressInvalid() {
        let xAddress = "XVLhHMPHU98es4dbozjVtdWzVrDjtV18pX8zeUygYrCgrPh"
        let result = AddressCodec.isValidXAddress(xAddress: xAddress)
        XCTAssertFalse(result)
    }

    func testIsValidXAddressEmpty() {
        let xAddress = ""
        let result = AddressCodec.isValidXAddress(xAddress: xAddress)
        XCTAssertFalse(result)
    }
}