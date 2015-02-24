#!/usr/bin/env ruby

class Optional
   # def value(@value = "")
   #     puts "@value = #{value}"
   #     self
   # end
    def bar
        puts "this is bar"
        self
    end
    def method_missing(name, *args, &block)
        puts "tried to handle unknown method %s" % name # name is a symbol
        unless args.empty?
            puts "it had arguments: %p" % [args]
        end
        self
    end
end
 
example = Optional.new

example.foo          # prints “this is foo”
example.bar          # prints “this is bar”
example.grill        # prints “tried to handle unknown method grill”
example.ding("dong") # prints “tried to handle unknown method ding”
                     # prints “it had arguments: ["dong"]”

example.foo.bar.bla.suc.suc.bex("ebaba")

example.succ.succ.succ.succ.succ.to_s

Optional.new.no_such_method.value

# A user can have an account. When no account is associated with a user, its `nil`
#user = Optional.new(user)
#balance = user.account.balance.value #=> nil if user.account is nil

