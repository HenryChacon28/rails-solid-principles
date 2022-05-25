#Correct use of the Dependency Inversion Principle in Ruby

=begin
Let’s see an example of code that conforms to the DIP principle. 
Implementation of low-level details (outputting formats like PDF and HTML) is done in separate 
classes (PDF Formatter and HTML Formatter). 
In the code above, the printer ‒ a high-level object ‒ doesn’t depend directly on the 
implementation of low-level objects ‒ the PDF and HTML formatters. In addition, 
all modules depend on abstraction. Our high-level functionality is separated from all 
low-level details, so we’re able to easily change the low-level logic without system-wide implications.
=end

class Printer
    def initialize(data)
      @data = data
    end
  
    def print(formatter: PdfFormatter.new)
      formatter.format(@data)
    end
  end
  
  class PdfFormatter
    def format(data)
      # format data to Pdf logic
    end
  end
  
  class HtmlFormatter
    def format(data)
      # format data to Html logic
    end
  end