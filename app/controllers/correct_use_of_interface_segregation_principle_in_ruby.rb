# Correct use of the Interface Segregation Principle in Ruby

=begin
To make this example comply with the ISP principle, we created two interfaces: 
a separate user interface and a separate staff interface. In the “CoffeeMachineUserInterface,” 
a user will be able to choose a drink type (method “select_drink_type“), choose a portion size 
(method “select_portion“), select the amount of sugar they would like added to the drink 
(method “select_sugar_amount“), and start brewing the coffee (method “brew_coffee“). 
A staff member, using the “CoffeeMachineSeviceInterface,” will be able to choose among the
 following operations: clean the machine (method “clean_coffee_machine“), fill sugar 
 (method “fill_sugar_supply“), fill coffee beans (method “fill_coffee_beans“), and fill water supply
  (method “fill_water_supply“).
=end

class CoffeeMachineUserInterface
    def select_drink_type
        # select drink type logic
    end
  
    def select_portion
       # select portion logic
    end
  
    def select_sugar_amount
       # select sugar logic
    end
  
    def brew_coffee
       # brew coffee logic
    end
  end
  
  class CoffeeMachineServiceInterface
    def clean_coffee_machine
      # clean coffee machine logic
    end
  
    def fill_coffee_beans
      # fill coffee beans logic
    end
  
    def fill_water_supply
      # fill water logic
    end
  
    def fill_sugar_supply
      # fill sugar logic
    end
  end
  
  class Person
    def initialize
      @coffee_machine = CoffeeMachineUserInterface.new
    end
  
    def make_coffee
      @coffee_machine.select_drink_type
      @coffee_machine.select_portion
      @coffee_machine.select_sugar_amount
      @coffee_machine.brew_coffee
    end
  end
  
  class Staff
    def initialize
      @coffee_machine = CoffeeMachineServiceInterface.new
    end
  
    def serv
      @coffee_machine.clean_coffee_machine
      @coffee_machine.fill_coffee_beans
      @coffee_machine.fill_water_supply
      @coffee_machine.fill_sugar_supply
    end
  end