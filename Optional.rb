#!/usr/bin/env ruby

class Optional
    def initialize(user=nil)
      @user = user
    end
    def value(nilvalue = nil)
        puts "Value is: #{nilvalue}"
    end
    def method_missing(name, *args, &block)
        puts "Handle unknown method %s" % name # name is a symbol
        unless args.empty?
            puts "it had arguments: %p" % [args]
        end
        self
    end
end

puts "# The most basic example."
Optional.new(nil).no_such_method.value #=> nil

puts "# A user can have an account. When no account is associated with a user, its `nil`"
user = Optional.new(user)
balance = user.account.balance.value #=> nil if user.account is nil

puts "# You can chain method calls for as long as you want."
Optional.new(42).succ.succ.succ.succ.succ.value("47") #=> "47"

puts "# Methods can have arguments and even run blocks in this approach."

Optional.new(nil).succ(nil).succ("Juice").succ(1,2,3,4,5).succ("Bla","Bla","Bla").succ.value("Something")

