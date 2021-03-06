require 'stringio'

class Controller
  attr_accessor :inTextField, :outTextField, :window

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

  def applicationDidFinishLaunching(note)
    font = NSFont.fontWithName("Menlo-Regular", size: 13)
    @inTextField.setFont(font)
    @outTextField.setFont(font)
  end

  def applicationShouldTerminateAfterLastWindowClosed(application)
    true
  end
end
