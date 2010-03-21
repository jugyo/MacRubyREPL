require 'stringio'

class Controller
  attr_accessor :inTextField, :outTextField

  def evalText(sender)
    stdout = StringIO.new

    text = @inTextField.textStorage.mutableString

    begin
      $stdout = stdout
      outText = eval(text, TOPLEVEL_BINDING).inspect
    rescue Exception => e
      @outTextField.appendText(e.message + "\n")
    ensure
      $stdout = STDOUT
    end

    @outTextField.appendText(stdout.string)
    @outTextField.appendText("=> " + outText + "\n")
  end
end
