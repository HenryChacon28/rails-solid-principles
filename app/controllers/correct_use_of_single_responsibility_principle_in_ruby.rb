# Correct use of the Single Responsibility Principle in Ruby

=begin
After refactoring, we have two classes that each perform a specific task. 
The FinancialReportMailer class sends emails containing texts generated by the 
FinancialReportGenerator class. If we wanted to expand the class responsible for report 
generation in the future, we could simply make the necessary changes without having to 
touch the FinancialReportMailer class.
=end

class FinancialReportMailer
    def initialize(report, account)
      @report = report
      @account = account
    end
  
    def deliver
      Mailer.deliver(
        from: 'reporter@example.com',
        to: @account.email,
        subject: 'Financial report',
        body: @report
      )
    end
  end
  
  class FinancialReportGenerator
    def initialize(transactions)
      @transactions = transactions
    end
  
    def generate
      @transactions.map { |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
      }.join("\n")
    end
  end
  
  report = FinancialReportGenerator.new(transactions).generate
  FinancialReportMailer.new(report, account).deliver