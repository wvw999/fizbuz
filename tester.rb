require 'uri'
require 'net/http'

quit = 0
until quit == 1 do
    puts "\n\nSelect a.) Manual, b.) auto test, or q.) quit:"
    input = gets.chomp

    if ["a", "b", "q"].include? input
        if input == "a"
            puts "Input a value to test:"
            test = gets.chomp
            uri = URI('http://127.0.0.1:3000/fizzbuzzs?input=' + test)
            res = Net::HTTP.get_response(uri)
            puts res.body
        elsif input == "b"
            puts "Running Auto Test now..."
            (1...101).each do |val|
                uri = URI('http://127.0.0.1:3000/fizzbuzzs?input=' + val.to_s)
                res = Net::HTTP.get_response(uri)
                puts res.body
            end
        elsif input == "q"
            quit = 1
        end
    else
        puts "...invalid input, please try again"
    end
end