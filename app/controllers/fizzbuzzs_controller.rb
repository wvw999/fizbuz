class FizzbuzzsController < ApplicationController

    def index
        puts params[:input]
        if params[:input].to_i != nil && params[:input].to_i > 0 && params[:input].to_i < 1000000
            @query = params[:input].to_i
            if @query % 3 == 0 && @query % 5 == 0
                render json: { Input: @query, Result: "Fizzbuzz" }, status: 200
            elsif @query % 3 == 0
                render json: { Input: @query, Result: "Fizz" }, status: 200
            elsif @query % 5 == 0
                render json: { Input: @query, Result: "Buzz" }, status: 200
            else
                render json: { Input: @query, Result: @query }, status: 200
            end
        else
            render json: { Input: params[:input], Result: "Error, invalid input" }, status: 400
        end
    end
end
