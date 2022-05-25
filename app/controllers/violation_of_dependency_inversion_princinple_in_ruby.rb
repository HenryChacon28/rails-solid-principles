# Violation of the Dependency Inversion Principle in Ruby

=begin
In the code below, we have implemented logic for a printer
(the Printer class has the method print which performs data output).
The class Printer depends on classes PdfFormatter and HtmlFormatter instead of abstractions, 
which indicates the violation of the DIP principle since the classes PdfFormatter and 
HtmlFormatter may contain the logic that refers to other classes. Thus, we may impact all the 
related classes when modifying the class Printer:
=end

class Printer
    def initialize(data)
      @data = data
    end
  
    def print_pdf
      PdfFormatter.new.format(@data)
    end
  
    def print_html
      HtmlFormatter.new.format(@data)
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