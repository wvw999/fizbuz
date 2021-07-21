require 'uri'
require 'net/http'

quit = 0
until quit == 1 do
    puts "\n\nSelect a.) Manual, b.) auto test, or c.) quit:"
    input = gets.chomp

    if ["a", "b", "c"].include? input
        if input == "a"
            puts "Input a value to test:"
            test = gets.chomp
            uri = URI('http://127.0.0.1:3000/fizzbuzzs?input=' + test)
            res = Net::HTTP.get_response(uri)
            puts res.body
        elsif input == "b"
            puts "Running Auto Test now..."
            values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, "Hamster", "&*(dfg.?", "-599", ".00001", 111111111111111111111111, 0]
            values.each do |val|
                uri = URI('http://127.0.0.1:3000/fizzbuzzs?input=' + val.to_s)
                res = Net::HTTP.get_response(uri)
                puts res.body
            end
        elsif input == "c"
            quit = 1
        end
    else
        puts "...invalid input, please try again"
    end
end