//
//  HospitalRequest.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/18.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct HospitalResponse: Decodable {
    let localdata020301: Localdata020301

    enum CodingKeys: String, CodingKey {
        case localdata020301 = "LOCALDATA_020301"
    }
}

// MARK: - Localdata020301
struct Localdata020301: Decodable {
    let listTotalCount: Int
    let result: Result
    let row: [Row]

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
}

// MARK: - Result
struct Result: Decodable {
    let code, message: String

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Decodable {
    let opnsfteamcode, mgtno, apvpermymd, apvcancelymd: String
    let trdstategbn, trdstatenm, dtlstategbn, dtlstatenm: String
    let dcbymd, clgstdt, clgenddt, ropnymd: String
    let sitetel, sitearea, sitepostno, sitewhladdr: String
    let rdnwhladdr, rdnpostno, bplcnm, lastmodts: String
    let updategbn, updatedt, uptaenm, x: String
    let y, lindjobgbnnm, lindprcbgbnnm, lindseqno: String
    let rgtmbdsno, totepnum: String

    enum CodingKeys: String, CodingKey {
        case opnsfteamcode = "OPNSFTEAMCODE"
        case mgtno = "MGTNO"
        case apvpermymd = "APVPERMYMD"
        case apvcancelymd = "APVCANCELYMD"
        case trdstategbn = "TRDSTATEGBN"
        case trdstatenm = "TRDSTATENM"
        case dtlstategbn = "DTLSTATEGBN"
        case dtlstatenm = "DTLSTATENM"
        case dcbymd = "DCBYMD"
        case clgstdt = "CLGSTDT"
        case clgenddt = "CLGENDDT"
        case ropnymd = "ROPNYMD"
        case sitetel = "SITETEL"
        case sitearea = "SITEAREA"
        case sitepostno = "SITEPOSTNO"
        case sitewhladdr = "SITEWHLADDR"
        case rdnwhladdr = "RDNWHLADDR"
        case rdnpostno = "RDNPOSTNO"
        case bplcnm = "BPLCNM"
        case lastmodts = "LASTMODTS"
        case updategbn = "UPDATEGBN"
        case updatedt = "UPDATEDT"
        case uptaenm = "UPTAENM"
        case x = "X"
        case y = "Y"
        case lindjobgbnnm = "LINDJOBGBNNM"
        case lindprcbgbnnm = "LINDPRCBGBNNM"
        case lindseqno = "LINDSEQNO"
        case rgtmbdsno = "RGTMBDSNO"
        case totepnum = "TOTEPNUM"
    }
}


