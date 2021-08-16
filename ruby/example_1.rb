class Example1
    def self.run 
        for i in (1..32767)
            if i % 3 == 2 &&
               i % 5 == 3 &&
               i % 7 == 4
              puts "The number is #{i}"
              break
            end
        end
    end
end

Example1.run