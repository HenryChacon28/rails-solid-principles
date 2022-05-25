# Violation of the Single Responsibility Principle in Ruby

=begin
The class FinancialReportMailer handles two tasks: 
report generation (method “generate_report!”) and report sending (method “send_report”). 
The class looks quite simple as written. However, expanding this class in the future may be problematic,
 since we’ll likely have to change the logic of the class. The SRP principle tells us that a class 
 should implement one single task, and therefore according to this principle we should divide the 
 FinancialReportMailer class into two classes.
=end

class FinancialReportMailer
    def initialize(transactions, account)
      @transactions = transactions
      @account = account
      @report = ''
    end
  
    def generate_report!
      @report = @transactions.map {
        |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
      }.join("\n")
    end
  
    def send_report
      Mailer.deliver(
        from: 'reporter@example.com',
        to: @account.email,
        subject: 'your report',
        body: @report
      )
    end
  end
  
  mailer = FinancialReportMailer.new(transactions, account)
  mailer.generate_report!
  mailer.send_report