# Violation of the Open-Closed Principle in Ruby

=begin
Before we view an example of code that complies with the OCP principle, 
we’ll take a look at some code that demonstrates a violation of OCP. 
In the code below, the Logger class formats and sends logs. 
But the OCP principle isn’t followed, since we’ll have to modify the logger every time we need to 
add additional senders or formatters:
=end

class Logger
    def initialize(format, delivery)
      @format = format
      @delivery = delivery
    end
  
    def log(string)
      deliver format(string)
    end
  
    private
  
    def format(string)
      case @format
      when :raw
        string
      when :with_date
        "#{Time.now} #{string}"
      when :with_date_and_details
        "Log was creates at #{Time.now}, please check details #{string}"
      else
        raise NotImplementedError
      end
    end
  
    def deliver(text)
      case @delivery
      when :by_email
        Mailer.deliver(
          from: 'emergency@example.com',
          to: 'admin@example.com',
          subject: 'Logger report',
          body: text
        )
      when :by_sms
        client = Twilio::REST::Client.new('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'your_auth_token')
        client.account.messages.create(
          from: '+15017250604',
          to: '+15558675309',
          body: text
        )
      when :to_stdout
        STDOUT.write(text)
      else
        raise NotImplementedError
      end
    end
  end
  
  logger = Logger.new(:raw, :by_sms)
  logger.log('Emergency error! Please fix me!')