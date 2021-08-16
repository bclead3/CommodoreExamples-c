class Example1b
    UPPER_LIMIT = 32767
    def self.run 
        k = 1
        for i in (1..UPPER_LIMIT)
            if i % 3 == 2 &&
               i % 5 == 3 &&
               i % 7 == 4
              puts "The #{k} number is #{i}"
              k+=1
            end
        end
        puts "The total number of target values is #{k-1}"
    end
end

Example1b.run
