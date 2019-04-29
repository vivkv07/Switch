//
//  AppDelegate.swift
//  Switch 1.0
//
//  Created by Kovvuru, Vinayak Vivek on 1/28/17.
//  Copyright © 2017 Kovvuru, Vinayak Vivek. All rights reserved.
//

import Cocoa
import Foundation


class OnlyIntegerValueFormatter: NumberFormatter {
    
    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        
        // Ability to reset your field (otherwise you can't delete the content)
        // You can check if the field is empty later
        if partialString.isEmpty {
            return true
        }
        
        // Optional: limit input length
        /*
         if partialString.characters.count>3 {
         return false
         }
         */
        
        // Actual check
        return Int(partialString) != nil
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

extension String {
    var length: Int {
        return self.characters.count
    }
}


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    
    @IBOutlet weak var window: NSWindow!
    
    //General Buttons
    
    
    // Platform Search
    @IBOutlet weak var MPSContract: NSTextField!
    @IBOutlet weak var LinkTest: NSButton!
    @IBOutlet weak var InsideCDIDText: NSTextField!
    @IBOutlet weak var ONEDSP: NSButton!
    @IBOutlet weak var ONEDSPOrgText: NSTextField!
    @IBOutlet weak var ACETacticID: NSTextField!
    @IBOutlet weak var MPSTest: NSButton!
    @IBOutlet weak var MPSplanID: NSTextField!
    @IBOutlet weak var ONEDSPAdvText: NSTextField!
    
    
    
    //SEARCH TICKETS

    
    
    @IBOutlet weak var INCSearch: NSSearchField!

    @IBOutlet weak var JIRA: NSButton!
    @IBOutlet weak var ZD: NSButton!
    @IBOutlet weak var SNow: NSButton!
    @IBOutlet weak var INCerrorLabel: NSTextField!
    

         //Radio Buttons  (Platform Selection)
    @IBAction func JIRAClickedd(_ sender: Any) {
        ZD.state = NSOffState
        SNow.state = NSOffState
    }
    
    
    @IBAction func ZDClicked(_ sender: AnyObject) {
        JIRA.state = NSOffState
        SNow.state = NSOffState
    }
    
    @IBAction func SNClicked(_ sender: Any) {
        JIRA.state = NSOffState
        ZD.state = NSOffState
    }
 
    @IBAction func SerachTest(_ sender: AnyObject) {
        var name = INCSearch.stringValue
        let l1 = name.characters.count
        
        if l1 <= 3
        {
            
        }
        
        //JIRA
        if JIRA.state == NSOnState
        
        {
            
            var name = INCSearch.stringValue
            let newString = name.replacingOccurrences(of: " ", with: "+")
        
                let url = URL(string: "https://jira.ops.aol.com/secure/QuickSearch.jspa?searchString=\(newString)")
                NSWorkspace.shared().open(url!)
            
            INCSearch.stringValue = ""
            
        }
  
        
        //SERVICE NOW
        
        if SNow.state == NSOnState
        {
        INCerrorLabel.stringValue = ""
        var name = INCSearch.stringValue
        let newString = name.replacingOccurrences(of: " ", with: "%2B")
        let l1 = name.characters.count
        
        if l1 == 9 {
            let url = URL(string: "https://aol.service-now.com/textsearch.do?sysparm_ck=89c4024edbdff200f47051735e96195841bb0acab0c050444ad6f3be369152efc65458a7&sysparm_search=\(name)")
            NSWorkspace.shared().open(url!)
            
            INCerrorLabel.stringValue = ""
        }
        else
     
        {
            let url = URL(string: "https://aol.service-now.com/nav_to.do?uri=%2Ftextsearch.do%3Fsysparm_ck%3Dbf9caf5adbdb3600f47051735e9619712956132459e4120ee0924ba9ba607dbf85ade5ac%26sysparm_search%3D\(newString)")
            NSWorkspace.shared().open(url!)
        }
        
        INCSearch.stringValue = ""
        
        }
        
        //ZENDESK
        
        if ZD.state == NSOnState
            
        {
            
            var name = INCSearch.stringValue
            let newString = name.replacingOccurrences(of: " ", with: "+")
            
            let url = URL(string: "https://onebyaol.zendesk.com/agent/tickets/\(newString)")
            NSWorkspace.shared().open(url!)
            
            INCSearch.stringValue = ""
            
        }

    
    }
    
    
    //END OF SEARCH TICKETS
    
    @IBOutlet weak var PeoplePlaceButton: NSButton!
    
    @IBOutlet weak var TimeOutButton: NSButton!
    
    @IBOutlet weak var SchedulerButton: NSButton!
    
    @IBOutlet weak var GDriveButton: NSButton!
    
    //Essential Links
    @IBOutlet weak var PeoplePlace: NSTextField!
    @IBAction func PeoplePlaceButtonCliked(_ sender: AnyObject) {
        let url = URL(string: "https://peopleplace.ops.aol.com/")
        NSWorkspace.shared().open(url!)
    }
    
    @IBAction func TimeOutButtonClicked(_ sender: Any) {
        let url = URL(string: "https://aol.unitysuite.com/aol/aspx/TOHomePage.aspx")
        NSWorkspace.shared().open(url!)
    }
    
    
    @IBAction func SchedulerButtonClicked(_ sender: Any) {
        let url = URL(string: "http://scheduler.noc.aol.com/index.php?station=49&cal=Station")
        NSWorkspace.shared().open(url!)
       
    }
    
  
    @IBAction func GDriveButtonClicked(_ sender: Any) {
        let url = URL(string: "https://drive.google.com/drive/folders/0B7hLF15ZhC-JM2VJZ0pBWURhUTQ")
        NSWorkspace.shared().open(url!)
    }
    
    @IBOutlet weak var MyTimeSheet: NSButton!
    @IBAction func MyTimeSheetButtonCliked(_ sender: AnyObject) {
        let url = URL(string: "https://peopleplacetransaction.ops.aol.com/psp/psepprd1/EMPLOYEE/EMPL/s/WEBLIB_AOL_AW.ISCRIPT1.FieldFormula.IScript_AssemblePage?AWGroupID=AOL_MYTIMESHEET&AWPageID=AOL_MY_TIME_SHEET&AWObjName=AOL_MY_TIME_SHEET")
        NSWorkspace.shared().open(url!)
    }
    
    @IBOutlet weak var MYPayCheck: NSButton!
    @IBAction func MyPayCheckButtonCliked(_ sender: AnyObject) {
        let url = URL(string: "https://workcenter.secure.probusiness.com/wp_prwc21/logon.asp")
        NSWorkspace.shared().open(url!)
    }
    
    @IBOutlet weak var MyCalendar: NSButton!
    @IBAction func MyCalendarButtonCliked(_ sender: AnyObject) {
        let url = URL(string: "https://calendar.google.com/calendar")
        NSWorkspace.shared().open(url!)
    }
    
    
    
    //TABs
    
    
    
    //ACCESS TAB
    
    //General Buttons
    @IBOutlet weak var Off: NSView!
    @IBOutlet weak var ON: NSView!
    @IBOutlet weak var OffButton: NSButton!
    @IBOutlet weak var LButton: NSButton!
    @IBOutlet weak var OnButton: NSButton!
    
    //Websites or Platforms Checkbox
    @IBOutlet weak var MPS: NSButton!
    @IBOutlet weak var SN: NSButton!
    @IBOutlet weak var ACE: NSButton!
    @IBOutlet weak var OC: NSButton!
    @IBOutlet weak var Rep: NSButton!
    @IBOutlet weak var Gmail: NSButton!
    @IBOutlet weak var Uplynk: NSButton!
    @IBOutlet weak var Go90: NSButton!
    
    //Applications Checkbox
    @IBOutlet weak var SQL: NSButton!
    @IBOutlet weak var Messages: NSButton!
    @IBOutlet weak var Slack: NSButton!
    @IBOutlet weak var Snagit: NSButton!
    
    //ShiftStatus ON button
    @IBAction func OnAction(_ sender: AnyObject) {
        
        
        if let url = URL(string: "https://aol.service-now.com/nav_to.do?uri=%2Fu_noc_shift_status_list.do%3Fsysparm_userpref_module%3D5dc0294c13f1660059f2b9785144b0fb%26sysparm_clear_stack%3Dtrue%26sysparm_clear_stack%3Dtrue"), NSWorkspace.shared().open(url) {
            print("default browser was successfully opened")
        }
        
        LButton.isEnabled = true
        OffButton.isEnabled = false
        OffButton.state = NSOffState
        OnButton.isEnabled = false
        
    }
    
    
    
    // Launch button
    
    
    @IBAction func Launch(_ sender: AnyObject) {
        
        
        //Applications
        
        switch Slack.state {
        case NSOnState:
            NSWorkspace.shared().launchApplication("/Applications/Slack.app")
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        switch SQL.state {
        case NSOnState:
            NSWorkspace.shared().launchApplication("/Applications/SQLDeveloper.app")
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        switch Messages.state {
        case NSOnState:
            NSWorkspace.shared().launchApplication("/Applications/Messages.app")
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        switch Snagit.state {
        case NSOnState:
            NSWorkspace.shared().launchApplication("/Applications/Snagit.app")
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        
        
        //Websites
        
        switch SN.state {
        case NSOnState:
            let checkURL = URL(string: "https://aol.service-now.com/nav_to.do")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        
        switch ACE.state {
        case NSOnState:
            print("on")
            let checkURL = URL(string: "https://adgui-prod.advertising.aol.com/adserve/AdServe.asp?forward=")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        switch MPS.state {
        case NSOnState:
            print("on")
            let checkURL = URL(string: "https://mps.aol.com")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        
        switch OC.state {
        case NSOnState:
            print("on")
            let checkURL = URL(string: "https://one.aol.com/one-central/")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        
        switch Uplynk.state {
        case NSOnState:
            let checkURL = URL(string: "https://uplynk-multiviewer.ops.go90.com/")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        
        switch Go90.state {
        case NSOnState:
            let checkURL = URL(string: "https://www.go90.com")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        switch Gmail.state {
        case NSOnState:
            let checkURL = URL(string: "https://www.gmail.com/")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
        
        
        switch Rep.state {
        case NSOnState:
            let checkURL = URL(string: "https://reporting.advertising.aol.com/reporting-ui/#/")
            NSWorkspace.shared().open(checkURL!)
        case NSOffState:
            print("off")
        default:
            print("mixed")
        }
    }
    
    
    
    //Access req search
    
    @IBAction func Accessreq(_ sender: AnyObject) {
        AccessReqText.stringValue = ""
    }
    @IBAction func InsideTextBoxButton(_ sender: AnyObject) {
        InsideCDIDText.stringValue = "Name/CDID/Email"
    }
    @IBOutlet weak var ONECAccessRequestButton: NSButton!
    @IBOutlet weak var ACEAccessRequestButton: NSButton!
    @IBOutlet weak var AMPAccessRequestButton: NSButton!
    
    @IBAction func ONECAccessRequestButtonSelected(_ sender: AnyObject) {
        
        
        AMPAccessRequestButton.state = NSOffState
        ACEAccessRequestButton.state = NSOffState
        
    }
    
    
    @IBAction func ACEAccessRequestButtonSelected(_ sender: AnyObject) {
        
        AMPAccessRequestButton.state = NSOffState
        ONECAccessRequestButton.state = NSOffState
        
    }
    
    
    @IBAction func AMPAccessRequestButtonSelected(_ sender: AnyObject) {
        
        ACEAccessRequestButton.state = NSOffState
        ONECAccessRequestButton.state = NSOffState
        
    }
    
    
    
    @IBOutlet weak var AccessReqText: NSTextField!
    @IBOutlet weak var AccessRequestSearchButton: NSButton!
    @IBAction func AccessReqButtonClicked(_ sender: AnyObject) {

        
        if ONECAccessRequestButton.state == NSOnState        {
            var name = AccessReqText.stringValue
            if name.isEmpty {
                name = "Error"
            }
            let url = URL(string: "https://one.aol.com/one-central/#/user/\(name)")
            NSWorkspace.shared().open(url!)
            AccessReqText.stringValue = ""
        }
        
        if AMPAccessRequestButton.state == NSOnState        {
            var name = AccessReqText.stringValue
            if name.isEmpty {
                name = "Error"
            }
            let url = URL(string: "https://admin.amp.aol.com/publish/users/")
            NSWorkspace.shared().open(url!)
            AccessReqText.stringValue = ""
        }
        if ACEAccessRequestButton.state == NSOnState        {
            var name = AccessReqText.stringValue
            if name.isEmpty {
                name = "Error"
            }
            let url = URL(string: "https://adgui-prod.advertising.aol.com/adserve/Application/Systemuser_Search.asp?Action=Search")
            NSWorkspace.shared().open(url!)
        }
    }
    
    
    //Inside search
    
    @IBAction func InsideButtonClicked(_ sender: AnyObject)  {
        
        var name = InsideCDIDText.stringValue
         let newString = name.replacingOccurrences(of: " ", with: "%20")
        if name.isEmpty {
            name = "Error"
        }
        let url = URL(string: "https://inside.teamaol.com/inside/search/\(newString)")
        NSWorkspace.shared().open(url!)
        InsideCDIDText.stringValue = ""
        
    }
    
    //END of the ACCESS TAB
    
    
    
    //MPS TAB
    
    
    
    //MPS Plan Search
    
    
    
    @IBOutlet weak var DateChange: NSButton!
    
    @IBOutlet weak var BillType: NSButton!
    
    @IBOutlet weak var Actualization: NSButton!
    
    
    @IBAction func DateChangeClicked(_ sender: Any) {
        
        BillType.state = NSOffState
        Actualization.state = NSOffState
        
        
        SQLMPSLineID.isEnabled = true
        MPSUserID.isEnabled = true
        MPSPlanVersion.isEnabled = true
        DayCombo.isEnabled = true
        MonthCombo.isEnabled = true
        YearCombo.isEnabled = true
        StartDateButton.isEnabled = true
        EndDateButton.isEnabled = true
        SqlErrorText.isEnabled = true
        SQLResult.isEnabled = true
        SelectStatement.isEnabled = true
        UpdateStatement.isEnabled = true
        StartDateButton.isEnabled = true
        EndDateButton.isEnabled = true
        
        
        //Actualization
        SoldRate.isEnabled = false
        ListRate.isEnabled = false
        Quantity.isEnabled = false
        Value.isEnabled = false
        
        SoldRateGross.isEnabled = false
        NetActualization.isEnabled = false
        GrossActualization.isEnabled = false
        
        CPM.isEnabled = false
        CPC.isEnabled = false
        CPD.isEnabled = false
        Reset.isEnabled = false
        CalcActualization.isEnabled = false
        
        //Billtype
        
        MPSContractID.isEnabled = false
        
    }
    
    @IBOutlet weak var MPSContractID: NSTextField!
    
    
    @IBAction func BillTypeClicked(_ sender: Any) {
        
        DateChange.state = NSOffState
        Actualization.state = NSOffState
        
        
        MPSContractID.isEnabled = true
        
        //Actualization
        
        NetActualization.isEnabled = false
        GrossActualization.isEnabled = false
        
        CPM.isEnabled = false
        CPC.isEnabled = false
        CPD.isEnabled = false
        Reset.isEnabled = false
        CalcActualization.isEnabled = false
        
        
        //date change disable
        SoldRate.isEnabled = true
        ListRate.isEnabled = true
        Quantity.isEnabled = true
        SoldRateGross.isEnabled = true
        SQLMPSLineID.isEnabled = false
        MPSUserID.isEnabled = false
        MPSPlanVersion.isEnabled = false
        DayCombo.isEnabled = false
        MonthCombo.isEnabled = false
        YearCombo.isEnabled = false
        StartDateButton.isEnabled = false
        EndDateButton.isEnabled = false
        SqlErrorText.isEnabled = false
        SQLResult.isEnabled = false
        MPSPlanVersion.isEnabled = false
        StartDateButton.isEnabled = false
        EndDateButton.isEnabled = false
        
        
    }
    
    @IBAction func ActualizationClicked(_ sender: Any) {
      
        SQLMPSLineID.isEnabled = true
        MPSUserID.isEnabled = true
        MPSPlanVersion.isEnabled = true
        
        BillType.state = NSOffState
        DateChange.state = NSOffState
        
        
        NetActualization.isEnabled = true
        GrossActualization.isEnabled = true
        
        CPM.isEnabled = true
        CPC.isEnabled = true
        CPD.isEnabled = true
        Reset.isEnabled = true
        CalcActualization.isEnabled = true
        
       

        
        //date change disable
        
       
        DayCombo.isEnabled = false
        MonthCombo.isEnabled = false
        YearCombo.isEnabled = false
        StartDateButton.isEnabled = false
        EndDateButton.isEnabled = false
        SqlErrorText.isEnabled = false
        SQLResult.isEnabled = false
    
        StartDateButton.isEnabled = false
        EndDateButton.isEnabled = false
        
        //bill type
        
        MPSContractID.isEnabled = false

        
    }
    

    
    
    
    @IBAction func MPSButtonClicked(_ sender: AnyObject)  {
        
        let name = MPSplanID.stringValue
        
        
        if name.isEmpty {
            SqlErrorText.stringValue = "MPS Plan ID is empty!"
        }
        
        let l1 = name.characters.count
        
        if l1 == 8
        {
            let url = URL(string: "https://mps.aol.com/MediaPlanner/externalPlan.action?mediaPlanId=\(name)")
            NSWorkspace.shared().open(url!)
            MPSplanID.stringValue = ""
            SqlErrorText.stringValue = ""
        }
        else
        {
            SqlErrorText.stringValue = "MPS Plan ID is wrong!"
        }
        
    }
    
    
    
    //Fields
    @IBOutlet weak var SQLMPSLineID: NSTextField!
    @IBOutlet weak var MPSUserID: NSTextField!
    @IBOutlet weak var MPSPlanVersion: NSComboBox!
    @IBOutlet weak var SQLQueryGenerate: NSButton!
    @IBOutlet weak var SQLResult: NSTextField!
    
    @IBOutlet weak var UpdateStatement: NSTextField!
    @IBOutlet weak var SelectStatement: NSTextField!
    
    //Buttons and ComboBox
    //Date Change
    @IBOutlet weak var EndDateButton: NSButton!
    @IBOutlet weak var StartDateButton: NSButton!
    
    @IBOutlet weak var DayCombo: NSComboBox!
    @IBOutlet weak var MonthCombo: NSComboBox!
    @IBOutlet weak var YearCombo: NSComboBox!
    
    
    @IBAction func StartDateAction(_ sender: Any) {
        EndDateButton.state = NSOffState
    }
    
    
    @IBAction func EndDateAction(_ sender: Any) {
        
        StartDateButton.state = NSOffState
    }
    
    
    //Actualization
    
    @IBOutlet weak var SoldRate: NSTextField!
    @IBOutlet weak var Value: NSTextField!
    @IBOutlet weak var Quantity: NSTextField!
    @IBOutlet weak var ListRate: NSTextField!
    @IBOutlet weak var Adjustment: NSTextField!
    @IBOutlet weak var BaseRate: NSTextField!
    @IBOutlet weak var ValueGross: NSTextField!
    @IBOutlet weak var SoldRateGross: NSTextField!
    @IBOutlet weak var TestLabelResult: NSTextField!
    
    @IBOutlet weak var NetActualization: NSButton!
    @IBOutlet weak var GrossActualization: NSButton!
    @IBOutlet weak var CalcActualization: NSButton!
    @IBOutlet weak var Reset: NSButton!
    
    @IBOutlet weak var CPM: NSButton!
    @IBOutlet weak var CPD: NSButton!
    @IBOutlet weak var CPC: NSButton!
    
    //NET
    
    @IBAction func NetActualizationAction(_ sender: Any) {
        GrossActualization.state = NSOffState
        SoldRate.isEnabled = true
        ListRate.isEnabled = true
        Quantity.isEnabled = true
        Value.isEnabled = true
        SoldRate.stringValue = ""
        Quantity.stringValue = ""
        Value.stringValue = ""
        
        
    }
    
    @IBAction func CPMClick(_ sender: Any) {
        
            CPD.state = NSOffState
            CPC.state = NSOffState

    }
    
    
    @IBAction func CPDClick(_ sender: Any) {
        CPC.state = NSOffState
        CPM.state = NSOffState
    }
    
    
    @IBAction func CPCClick(_ sender: Any) {
        CPD.state = NSOffState
        CPM.state = NSOffState
    }
    
    
    
    
    
    
    //GROSS
    
    @IBAction func GrossActualizationAction(_ sender: Any) {
        
        NetActualization.state = NSOffState
        SoldRate.isEnabled = true
        ListRate.isEnabled = true
        Quantity.isEnabled = true
        SoldRateGross.isEnabled = true
        SoldRateGross.stringValue = ""
        ValueGross.isEnabled = true
        ValueGross.stringValue = ""
        SoldRate.stringValue = ""
        Quantity.stringValue = ""
        Value.isEnabled = true
        Value.stringValue = ""
        
    }

    
 
    //Calculation
    
    @IBAction func ActualizationCalc(_ sender: Any) {
        
        
        
        TestLabelResult.stringValue = ""
        
        if NetActualization.state == NSOnState
        {
            //CPM
            if CPM.state == NSOnState
            {
                if Value.stringValue == ""
                {
                    var n1 = (SoldRate.doubleValue * Quantity.doubleValue)/1000
                    var roundedString = String(format: "%.2f", n1)
                    Value.stringValue  = roundedString.description
                    var n2 = (SoldRate.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString1 = String(format: "%.2f", n2)
                    Adjustment.stringValue = roundedString1.description
                }
                
                if Quantity.stringValue == ""
                {
                    var n1 = (Value.doubleValue * 1000/SoldRate.doubleValue)
                    var roundedString = String(format: "%.0f", n1)
                    Quantity.stringValue = roundedString.description
                    var n2 = (SoldRate.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString1 = String(format: "%.2f", n2)
                    Adjustment.stringValue = roundedString1.description
                }
                
                if ListRate.stringValue == "" || SoldRate.stringValue == ""
                {
                    TestLabelResult.stringValue = "We need Soldrate and Listrate to calculate! "
                }
                
            }
            
            //CPD
            
            if CPD.state == NSOnState
            {
                if Value.stringValue == ""
                {
                    var n1 = (SoldRate.doubleValue * Quantity.doubleValue)
                    var roundedString = String(format: "%.2f", n1)
                    Value.stringValue  = roundedString.description
                    var n2 = (SoldRate.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString1 = String(format: "%.2f", n2)
                    Adjustment.stringValue = roundedString1.description
                }
                
                if Quantity.stringValue == ""
                {
                    var n1 = (Value.doubleValue / SoldRate.doubleValue)
                    var roundedString = String(format: "%.0f", n1)
                    Quantity.stringValue = roundedString.description
                    var n2 = (SoldRate.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString1 = String(format: "%.2f", n2)
                    Adjustment.stringValue = roundedString1.description
                }
                
                if ListRate.stringValue == "" || SoldRate.stringValue == ""
                {
                    TestLabelResult.stringValue = "We need Soldrate and Listrate to calculate! "
                }
                
            }
            
            //CPC
            
            if CPC.state == NSOnState
            {
                if Value.stringValue == ""
                {
                    var n1 = (SoldRate.doubleValue * Quantity.doubleValue)
                    var roundedString = String(format: "%.2f", n1)
                    Value.stringValue  = roundedString.description
                    var n2 = (SoldRate.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString1 = String(format: "%.2f", n2)
                    Adjustment.stringValue = roundedString1.description
                }
                
                if Quantity.stringValue == ""
                {
                    var n1 = (Value.doubleValue / SoldRate.doubleValue)
                    var roundedString = String(format: "%.0f", n1)
                    Quantity.stringValue = roundedString.description
                    var n2 = (SoldRate.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString1 = String(format: "%.2f", n2)
                    Adjustment.stringValue = roundedString1.description
                }
                
                if ListRate.stringValue == "" || SoldRate.stringValue == ""
                {
                    TestLabelResult.stringValue = "We need Soldrate and Listrate to calculate! "
                }
                
            }
            
        }
        
        
        
        
        //END of NET 
        
        
        //GROSS
        
        
        
        if GrossActualization.state == NSOnState
        {
            TestLabelResult.stringValue = ""
            
            //CPM
            if CPM.state == NSOnState
            {
                if Value.stringValue == "" && ValueGross.stringValue == "" && SoldRateGross.stringValue == ""
                {
                    var n1 = (SoldRate.doubleValue / (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    SoldRateGross.stringValue  = roundedString.description
                    
                    var n2 = (SoldRateGross.doubleValue * (Quantity.doubleValue / 1000))
                    var roundedString1 = String(format: "%.2f", n2)
                    ValueGross.stringValue = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString2 = String(format: "%.2f", n3)
                    Value.stringValue  = roundedString.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                if Quantity.stringValue == "" && ValueGross.stringValue == "" && SoldRateGross.stringValue == ""
                {
                    var n1 = (Value.doubleValue / (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    ValueGross.stringValue  = roundedString.description
                    
                    var n2 = (SoldRate.doubleValue / (1-15/100))
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRateGross.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * 1000/SoldRateGross.doubleValue)
                    var roundedString2 = String(format: "%.0f", n3)
                    Quantity.stringValue = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if SoldRate.stringValue == "" && ValueGross.stringValue == "" && Value.stringValue == ""
                {
                    var n1 = ((SoldRateGross.doubleValue * Quantity.doubleValue) / 1000)
                    var roundedString = String(format: "%.2f", n1)
                    ValueGross.stringValue  = roundedString.description
                    
                    var n2 = (Value.doubleValue * 1000/Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRate.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString2 = String(format: "%.2f", n3)
                    Value.stringValue  = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if SoldRate.stringValue == "" && Quantity.stringValue == "" && Value.stringValue == ""
                {
                    var n1 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    Value.stringValue  = roundedString.description
                    
                    var n2 = (Value.doubleValue * 1000/Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRate.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * 1000/SoldRateGross.doubleValue)
                    var roundedString2 = String(format: "%.0f", n3)
                    Quantity.stringValue = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if ValueGross.stringValue != "" && Quantity.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value Gross and Quantity together! "
                }
                
                if ValueGross.stringValue != "" && SoldRate.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value Gross and SoldRate together! "
                }
                
                if ValueGross.stringValue != "" && Quantity.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value and Quantity together! "
                }
                
                if Value.stringValue != "" && SoldRate.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value and SoldRate together! "
                }
                
            } // END OF CPM 
            
            
            
            
           //CPD GROSS
            
            
            if CPD.state == NSOnState
            {
                if Value.stringValue == "" && ValueGross.stringValue == "" && SoldRateGross.stringValue == ""
                {
                    var n1 = (SoldRate.doubleValue / (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    SoldRateGross.stringValue  = roundedString.description
                    
                    var n2 = (SoldRateGross.doubleValue * Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    ValueGross.stringValue = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString2 = String(format: "%.2f", n3)
                    Value.stringValue  = roundedString.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                if Quantity.stringValue == "" && ValueGross.stringValue == "" && SoldRateGross.stringValue == ""
                {
                    var n1 = (Value.doubleValue / (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    ValueGross.stringValue  = roundedString.description
                    
                    var n2 = (SoldRate.doubleValue / (1-15/100))
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRateGross.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue / SoldRateGross.doubleValue)
                    var roundedString2 = String(format: "%.0f", n3)
                    Quantity.stringValue = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if SoldRate.stringValue == "" && ValueGross.stringValue == "" && Value.stringValue == ""
                {
                    var n1 = (SoldRateGross.doubleValue * Quantity.doubleValue)
                    var roundedString = String(format: "%.2f", n1)
                    ValueGross.stringValue  = roundedString.description
                    
                    var n2 = (Value.doubleValue / Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRate.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString2 = String(format: "%.2f", n3)
                    Value.stringValue  = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if SoldRate.stringValue == "" && Quantity.stringValue == "" && Value.stringValue == ""
                {
                    var n1 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    Value.stringValue  = roundedString.description
                    
                    var n2 = (Value.doubleValue / Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRate.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue / SoldRateGross.doubleValue)
                    var roundedString2 = String(format: "%.0f", n3)
                    Quantity.stringValue = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if ValueGross.stringValue != "" && Quantity.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value Gross and Quantity together! "
                }
                
                if ValueGross.stringValue != "" && SoldRate.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value Gross and SoldRate together! "
                }
                
                if ValueGross.stringValue != "" && Quantity.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value and Quantity together! "
                }
                
                if Value.stringValue != "" && SoldRate.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value and SoldRate together! "
                }
                
            } // END OF CPD
            
            
            
            
            
            if CPC.state == NSOnState
            {
                if Value.stringValue == "" && ValueGross.stringValue == "" && SoldRateGross.stringValue == ""
                {
                    var n1 = (SoldRate.doubleValue / (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    SoldRateGross.stringValue  = roundedString.description
                    
                    var n2 = (SoldRateGross.doubleValue * Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    ValueGross.stringValue = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString2 = String(format: "%.2f", n3)
                    Value.stringValue  = roundedString.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                if Quantity.stringValue == "" && ValueGross.stringValue == "" && SoldRateGross.stringValue == ""
                {
                    var n1 = (Value.doubleValue / (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    ValueGross.stringValue  = roundedString.description
                    
                    var n2 = (SoldRate.doubleValue / (1-15/100))
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRateGross.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue / SoldRateGross.doubleValue)
                    var roundedString2 = String(format: "%.0f", n3)
                    Quantity.stringValue = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if SoldRate.stringValue == "" && ValueGross.stringValue == "" && Value.stringValue == ""
                {
                    var n1 = (SoldRateGross.doubleValue * Quantity.doubleValue)
                    var roundedString = String(format: "%.2f", n1)
                    ValueGross.stringValue  = roundedString.description
                    
                    var n2 = (Value.doubleValue / Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRate.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString2 = String(format: "%.2f", n3)
                    Value.stringValue  = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if SoldRate.stringValue == "" && Quantity.stringValue == "" && Value.stringValue == ""
                {
                    var n1 = (ValueGross.doubleValue * (1-15/100))
                    var roundedString = String(format: "%.2f", n1)
                    Value.stringValue  = roundedString.description
                    
                    var n2 = (Value.doubleValue / Quantity.doubleValue)
                    var roundedString1 = String(format: "%.2f", n2)
                    SoldRate.stringValue  = roundedString1.description
                    
                    var n3 = (ValueGross.doubleValue / SoldRateGross.doubleValue)
                    var roundedString2 = String(format: "%.0f", n3)
                    Quantity.stringValue = roundedString2.description
                    
                    var n4 = (SoldRateGross.doubleValue / ListRate.doubleValue - 1) * 100
                    var roundedString3 = String(format: "%.2f", n4)
                    Adjustment.stringValue = roundedString3.description
                }
                
                
                if ValueGross.stringValue != "" && Quantity.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value Gross and Quantity together! "
                }
                
                if ValueGross.stringValue != "" && SoldRate.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value Gross and SoldRate together! "
                }
                
                if ValueGross.stringValue != "" && Quantity.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value and Quantity together! "
                }
                
                if Value.stringValue != "" && SoldRate.stringValue != ""
                {
                    TestLabelResult.stringValue = "We do not accept Value and SoldRate together! "
                }
                
            } // END OF CPC GROSS

        
        }
        
        

    } //end of calculation part of actualization calculator.
    
    

//BillTYPE CHANGE VARIABLE DEFINITION
    
    
    @IBOutlet weak var BillonActuals: NSButton!
    
    @IBOutlet weak var Scheduled: NSButton!
    
    @IBOutlet weak var Prepaid: NSButton!
    
    @IBOutlet weak var CustomBilling: NSButton!
    
    @IBOutlet weak var ContractID: NSTextField!
    
    @IBAction func BillOnActualsClicked(_ sender: Any) {
        
        Scheduled.state = NSOffState
        Prepaid.state = NSOffState
        CustomBilling.state = NSOffState
        
    }
    
    
    @IBAction func PrepaidClicked(_ sender: Any) {
        
        Scheduled.state = NSOffState
        BillonActuals.state = NSOffState
        CustomBilling.state = NSOffState
    }
    
    
    @IBAction func ScheduledClicked(_ sender: Any) {
        BillonActuals.state = NSOffState
        Prepaid.state = NSOffState
        CustomBilling.state = NSOffState
    }
    
    
    @IBAction func CustomBillingClicked(_ sender: Any) {
        
        Scheduled.state = NSOffState
        Prepaid.state = NSOffState
        BillonActuals.state = NSOffState
    }
    
    
    @IBAction func ResetActValues(_ sender: Any) {
        NetActualization.state = NSOffState
        
        GrossActualization.state = NSOffState
        CPC.state = NSOffState
        CPD.state = NSOffState
        CPM.state = NSOffState
        SoldRate.stringValue = ""
        SoldRateGross.stringValue = ""
        Value.stringValue = ""
        ValueGross.stringValue = ""
        Adjustment.stringValue = ""
        Quantity.stringValue = ""
        ListRate.stringValue = ""
        
        TestLabelResult.stringValue = ""
        

    }
    

    
    
    
    //Date Change
    
    
    //QUERY GENERATION LOGIC
    
    
    
    @IBOutlet weak var SqlErrorText: NSTextField!
    
    @IBAction func SQLQueryGen(_ sender: Any) {
        
        
        
if DateChange.state == NSOnState
{
        let mpsplanid = MPSplanID.stringValue
        let mpslineid = SQLMPSLineID.stringValue
        let mpsuserid = MPSUserID.stringValue
        let mpsplanvers = MPSPlanVersion.stringValue
        
        //Date Change
        let mpsday = DayCombo.stringValue
        let mpsmonth = MonthCombo.stringValue
        let mpsyear = YearCombo.stringValue
        
        var name = MPSplanID.stringValue
        let l1 = name.characters.count
        var name2 = SQLMPSLineID.stringValue
        let l2 = name2.characters.count
        var name3 = MPSUserID.stringValue
        let l3 = name3.characters.count
        
        SqlErrorText.stringValue = ""
        SelectStatement.stringValue = ""
        UpdateStatement.stringValue = ""
        
        if name.isEmpty {
            SqlErrorText.stringValue = "**MPS Plan ID is empty!**"
        }
        if name2.isEmpty {
            SqlErrorText.stringValue = "**MPS Line ID(s) is empty!**"
        }
        if name3.isEmpty {
            SqlErrorText.stringValue = "**MPSUSPRD User ID is empty!**"
        }
        
        
        
        if l1 > 1
        {
            if l2 > 6
            {
                if l3 == 4
                {
                    if StartDateButton.state == NSOnState
                    {
                        let result1 = "\nSELECT * FROM DBO_MEDIAPLAN.tblFlight \nwhere LineID in (select ID from DBO_MEDIAPLAN.tblMediaPlanLines \nwhere SequenceNumber in (\(mpslineid)) and MEDIAPLANID = \(mpsplanid) and version = \(mpsplanvers));"
                        
                        let result2 = "\nUPDATE DBO_MEDIAPLAN.tblFlight SET startdate = TO_DATE(' \(mpsday)-\(mpsmonth)-\(mpsyear) 00:00','DD-MON-YYYY HH24:MI'),MODIFYUSERID = \(mpsuserid) ,MODIFYDATETIME = sysdate \nwhere LineID in (select ID from DBO_MEDIAPLAN.tblMediaPlanLines \nwhere SequenceNumber in (\(mpslineid)) and MEDIAPLANID = \(mpsplanid) and version = \(mpsplanvers) );"
                        
                        SelectStatement.stringValue = "********Select Statement*********\(result1)"
                        UpdateStatement.stringValue = "********Update Statement*********\(result2)"
                        
                    }
                    
                    if EndDateButton.state == NSOnState
                    {
                        
                        

                        let result1 = "\nSELECT * FROM DBO_MEDIAPLAN.tblFlight \nwhere LineID in (select ID from DBO_MEDIAPLAN.tblMediaPlanLines \nwhere SequenceNumber in (\(mpslineid)) and MEDIAPLANID = \(mpsplanid) and version = \(mpsplanvers));"
                        
                        let result2 = "\nUPDATE DBO_MEDIAPLAN.tblFlight SET enddate = TO_DATE(' \(mpsday)-\(mpsmonth)-\(mpsyear) 23:59','DD-MON-YYYY HH24:MI'),MODIFYUSERID = \(mpsuserid) ,MODIFYDATETIME = sysdate \nwhere LineID in (select ID from DBO_MEDIAPLAN.tblMediaPlanLines \nwhere SequenceNumber in (\(mpslineid)) and MEDIAPLANID = \(mpsplanid) and version = \(mpsplanvers) );"
                        
                        SelectStatement.stringValue = "********Select Statement*********\(result1)"
                        UpdateStatement.stringValue = "*********Update Statement********\(result2)"
                        

                    }
                }//userid closing
                    
                else
                {
                    
                    SqlErrorText.stringValue = "Please Enter Correct USER ID for MPSUSPRD"
                }
            } //for Line closing
            else
            {
                SqlErrorText.stringValue = "Please Enter Correct MPS Line ID(s)"
            }
            
        } //MPS Plan Closing
        else
        {
            SqlErrorText.stringValue = "Please check the MPS Plan ID"
        }
        
        
}
        

if Actualization.state == NSOnState
{
    
        var name2 = SQLMPSLineID.stringValue
        let l2 = name2.characters.count
        var name3 = MPSUserID.stringValue
        let l3 = name3.characters.count
        
        SqlErrorText.stringValue = ""
        SelectStatement.stringValue = ""
        UpdateStatement.stringValue = ""
        
    
        if name2.isEmpty {
            SqlErrorText.stringValue = "**MPS Line ID(s) is empty!**"
        }
        if name3.isEmpty {
            SqlErrorText.stringValue = "**MPSUSPRD User ID is empty!**"
        }
        
        
            if l2 > 6
            {
                if l3 == 4
                {
         
                        let soldrate = SoldRate.stringValue
                        let soldrategr = SoldRateGross.stringValue
                        let value = Value.stringValue
                        let valuegr = ValueGross.stringValue
                        let listrate = ListRate.stringValue
                        let qty = Quantity.stringValue
                        let adj = Adjustment.stringValue
                        let mpsplanvers = MPSPlanVersion.stringValue
                        let mpsuserid = MPSUserID.stringValue
                        let mpslineid = SQLMPSLineID.stringValue
                        
                        let result1 = "\nSELECT * FROM dbo_mediaplan.tblflight \nWHERE lineid IN (SELECT ID FROM dbo_mediaplan.tblmediaplanlines \nWHERE sequencenumber IN (\(mpslineid)) AND version = \(mpsplanvers));"
                        
                        
                        let result2 = " UPDATE dbo_mediaplan.tblflight SET \n--SoldRate = \(soldrate),\n--SoldRateGross = \(soldrategr), \n--BaseRate = 0.00, \n--changing base rate should be avoided unless absolutely necessary \n--ListRate = \(listrate), \n--Adjustment = \(adj), \n--Value = \(value), \n--ValueGross = \(valuegr),\n--Quantity = \(qty),\nModifyUserID = \(mpsuserid), ModifyDateTime = sysdate \nWHERE lineid IN (SELECT ID FROM dbo_mediaplan.tblmediaplanlines \nWHERE sequencenumber IN (\(mpslineid)) and version = \(mpsplanvers)); "
                        
                        SelectStatement.stringValue = "********Select Statement*********\(result1)"
                        UpdateStatement.stringValue = "********Update Statement*********\(result2)"
                        
              }
           }
        
}


        
        
        
        
if BillType.state == NSOnState
{
    /*let mpsplanvers = MPSPlanVersion.stringValue
    let mpsuserid = MPSUserID.stringValue
    let mpslineid = SQLMPSLineID.stringValue
    let mpscontract = MPSContractID.stringValue
    */
    /*let result2 = "UPDATE DBO_MEDIAPLAN.TBLMEDIAPLANS\n SET BILLINGMETHODID = X,MODIFYDATETIME = sysdate
    WHERE MEDIAPLANID = XXXXXXX \n
    AND VERSION = X \n
    AND BILLINGMETHODID = X; \n
    
    UPDATE DBO_MEDIAPLAN.TBLMEDIAPLANCONTRACT \n
    SET BILLINGMETHODID = X, \n
    MODIFYDATETIME = sysdate, \n
    MODIFYUSERID = 10000X \n
    WHERE CONTRACTNUMBER = XXXXXXX \n
    AND REVISION = X \n
    AND BILLINGMETHODID = X;" */
 
}
        
        
        
    }// Closing the SQL GENERATE BUTTON 
    

    //Clear Button
    
    @IBAction func MPSSqlClear(_ sender: Any) {
        
        //Date Change
        MPSplanID.stringValue = ""
        SQLMPSLineID.stringValue = ""
        MPSUserID.stringValue = ""
        MPSPlanVersion.stringValue = ""
        DayCombo.stringValue = "Day"
        MonthCombo.stringValue = "Month"
        YearCombo.stringValue = "Year"
        StartDateButton.state = NSOffState
        EndDateButton.state = NSOffState
        SqlErrorText.stringValue = ""
        SQLResult.stringValue = ""
        MPSPlanVersion.isHidden = false
        SelectStatement.stringValue = ""
        UpdateStatement.stringValue = ""
        StartDateButton.state = NSOffState
        EndDateButton.state = NSOffState
        
        
        
        
        
        //Actualization
        
        GrossActualization.state = NSOffState
        CPC.state = NSOffState
        CPD.state = NSOffState
        CPM.state = NSOffState
        SoldRate.stringValue = ""
        SoldRateGross.stringValue = ""
        Value.stringValue = ""
        ValueGross.stringValue = ""
        Adjustment.stringValue = ""
        Quantity.stringValue = ""
        ListRate.stringValue = ""
        
        TestLabelResult.stringValue = ""
        
        
    }
    
    //END OF MPS TAB
    
    // ONE DISPLAY TAB
    
    //ONE Display Dashboard search
    
    @IBAction func ONEDspButtonClicked(_ sender: AnyObject)  {
        
        
        
        var name1 = ONEDSPOrgText.stringValue
        
        if name1.isEmpty {
            name1 = "Error"
        }
        
        var name2 = ONEDSPAdvText.stringValue
        if name2.isEmpty {
            name2 = "Error"
        }
        let url = URL(string: "https://one.aol.com/dashboard/#/org/\(name1)/advertiser/\(name2)/control-center/campaigns/")
        NSWorkspace.shared().open(url!)
        ONEDSPAdvText.stringValue = ""
        ONEDSPOrgText.stringValue = ""
    }
    
    //END OF ONE DISPLAY TAB
    
    //ACE TAB
    
    //VALIDATION STEPS
    @IBOutlet weak var ErrorLabel: NSTextField!
    @IBAction func ACEButtonClicked(_ sender: AnyObject)  {
        
        let onlyIntFormatter = OnlyIntegerValueFormatter()
        ACETacticID.formatter = onlyIntFormatter
        
        var name = ACETacticID.stringValue
        //String Length
        let l1 = name.characters.count
        if l1 == 6 {
            let url = URL(string: "https://adgui.prod.advertising.aol.com/Adserve/Application/Campaign.asp?Action=Edit&id=\(name)")
            NSWorkspace.shared().open(url!)
        }
        
        if name.isEmpty {
            name = "Error"
        }
        
        ACETacticID.stringValue = ""
    }
    
    //END OF ACE TAB
    
    
    
    
    
    
    //INITIALIZATION
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let onlyIntFormatter = OnlyIntegerValueFormatter()
        MPSplanID.formatter = onlyIntFormatter
        
        ONEDSPAdvText.formatter = onlyIntFormatter
        
        ONEDSPOrgText.formatter = onlyIntFormatter
        
        ACETacticID.formatter = onlyIntFormatter
        
        SQLMPSLineID.formatter = onlyIntFormatter
        
        MPSUserID.formatter = onlyIntFormatter
        
        
        DayCombo.stringValue = "Day"
        MonthCombo.stringValue = "Month"
        YearCombo.stringValue = "Year"
        
    }
    
    //END OF INITIALIZATION

//Alert 
   
    
    //TERMINATION
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
            
                let alert = NSAlert()
                alert.messageText = "Do you want to Change the shift status ?"
                alert.informativeText = "This will redirect you to the shift status page on Service-Now!"
                alert.alertStyle = .warning
                
                // 3
                alert.addButton(withTitle: "Change")
                alert.addButton(withTitle: "I'm good!")
                
                // 4
                let response = alert.runModal()
                if response == NSAlertFirstButtonReturn {
                    if let url = URL(string: "https://aol.service-now.com/nav_to.do?uri=%2Fu_noc_shift_status_list.do%3Fsysparm_userpref_module%3D5dc0294c13f1660059f2b9785144b0fb%26sysparm_clear_stack%3Dtrue%26sysparm_clear_stack%3Dtrue"), NSWorkspace.shared().open(url) {
                        print("default browser was successfully opened")
                }
            }
        }
    
        }



//END OF TERMINATION


/*
 
 //Extra features !
 
 
 
 //Directory
 //ONCall
 
 @IBOutlet weak var ONCallText: NSTextField!
 @IBOutlet weak var ONCallSearchButton: NSButton!
 @IBAction func ONCallSearchClicked(_ sender: AnyObject) {
 
 var name = ONCallText.stringValue
 if name.isEmpty {
 name = "Error"
 }
 let url = URL(string: "https://orb.ops.aol.com/search/new_results.mc?term=\(name)")
 NSWorkspace.shared().open(url!)
 ONCallText.stringValue = ""
 }
 
 */


//END OF THE ENTIRE APPLICATION CODE
