//
//  CalendarViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var collectionView: JTAppleCalendarView!
    @IBOutlet weak var buttonBlurView: UIVisualEffectView!
    @IBOutlet weak var plusButton: UIButton!
    
    var events: [Event] = []
    let monthFormatter = DateFormatter()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = "Calendar"
        
        monthFormatter.dateFormat = "MMM"
        dateFormatter.dateFormat = "yyyy MM dd"

        self.getData()
        self.configureCollectionView()
        self.configureButton()
    }
    
    func getData() {
        self.events.append(Event(title: "CISC 325", startDate: Date(), endDate: Date(), color: .systemTeal))
        self.events.append(Event(title: "CISC 352", startDate: Date(), endDate: Date(), color: .systemBlue))
        self.events.append(Event(title: "CISC 325", startDate: Date(), endDate: Date(), color: .systemOrange))
        self.events.append(Event(title: "CISC 325", startDate: Date(), endDate: Date(), color: .systemPurple))
        self.events.append(Event(title: "CISC 325", startDate: Date(), endDate: Date(), color: .systemRed))
    }
    
    func configureButton() {
        self.buttonBlurView.contentView.layer.cornerRadius = self.buttonBlurView.frame.width/2
        self.plusButton.layer.cornerRadius = self.plusButton.frame.width/2
    }
    
    func configureCollectionView() {
        self.collectionView.scrollDirection = .vertical
//        self.collectionView.scrollingMode = .nonStopToCell(withResistance: 0.25)
        self.collectionView.scrollingMode = .stopAtEachCalendarFrame
        self.collectionView.showsVerticalScrollIndicator = false
        
//        UIView.animate(withDuration: 0.2, animations: {
//            self.view.layoutIfNeeded()
//            self.collectionView.reloadData(withanchor: Date())
//        })
    }
    
    @IBAction func addEvent(_ sender: Any) {
    }
}

extension CalendarViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {

        let startDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())!
        let endDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
        return ConfigurationParameters(startDate: startDate, endDate: endDate, generateInDates: .forAllMonths, generateOutDates: .tillEndOfRow, firstDayOfWeek: .sunday)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState, date: date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState, date: date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState, date: date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "DateHeader", for: indexPath) as! DateHeader
        header.monthLabel.text = self.monthFormatter.string(from: range.start)
        return header
    }

    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
//    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
//        return true
//    }
    
    // MARK: Configuring In/Out Dates for Calendar UI
    /// <#Description#>
    /// - Parameters:
    ///   - view: <#view description#>
    ///   - cellState: <#cellState description#>
    func configureCell(view: JTAppleCell?, cellState: CellState, date: Date) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
        cell.configureRows(events: events)
        // Configure visibility of cell text based on `.dateBelongsTo`
        handleCellVisibility(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState, date: date)
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - cell: <#cell description#>
    ///   - cellState: <#cellState description#>
    func handleCellSelected(cell: DateCell, cellState: CellState, date: Date) {
        if cellState.isSelected {
            cell.selectedView.layer.cornerRadius =  cell.selectedView.frame.width/2
            cell.selectedView.backgroundColor = date == Date() ? .systemRed : .label
            cell.dateLabel.textColor = .white
        } else {
            cell.dateLabel.textColor = .label
            cell.selectedView.backgroundColor = .clear
        }
    }
    /// <#Description#>
    /// - Parameters:
    ///   - cell: <#cell description#>
    ///   - cellState: <#cellState description#>
    func handleCellVisibility(cell: DateCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.dateLabel.textColor = .label
            cell.eventColorAlpha = 1
            
            if cellState.date == Date() {
                cell.backgroundColor = .secondarySystemBackground
            }
        } else {
            cell.dateLabel.textColor = .systemGray
            cell.eventColorAlpha = 0.5
        }
    }
}
