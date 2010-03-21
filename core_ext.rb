class NSTextView
  def appendText(string)
    self.selectAll(nil)
    wholeRange = self.selectedRange
    endRange = NSMakeRange(wholeRange.length, 0)
    self.setSelectedRange(endRange)
    self.insertText(string)
  end
end
