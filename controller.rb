class Controller
  attr_accessor :inTextField, :outTextField

  def evalText(sender)
    text = @inTextField.textStorage.mutableString
    outText = eval(text).inspect
    @outTextField.appendText(outText)
  end
end
