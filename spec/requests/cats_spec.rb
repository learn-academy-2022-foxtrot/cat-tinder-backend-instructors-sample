require 'rails_helper'

RSpec.describe "Cats", type: :request do

  describe "GET /index" do
    it "gets a list of cats" do
      # make an entry
      Cat.create(
        name: "Hazel",
        age: 3,
        enjoys: "biting everything",
        image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
      )

      # make a request
      get '/cats'

      cat = JSON.parse(response.body)

      # make assertions
      expect(response.status).to eq(200)
      expect(cat.length).to eq(1)
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      # symbolizes the data that would be sent from the html form to the database, stored in cat_params variable
      cat_params = {
        cat: {
          name: "Hazel",
          age: 3,
          enjoys: "biting everything",
          image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
        }
      }

      # send the request
      post "/cats", params: cat_params

      # look up the cat
      cat = Cat.first

      # to see the cat on the terminal
      p "cat on create method:", cat
      
      # Assertion
      expect(cat.name).to eq("Hazel")
      # make sure the the text or string place here matches the value for the data entry you created
      expect(cat.enjoys).to eq("biting everything")

    end
  end
end
