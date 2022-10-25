require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name exists in the db entry" do
    cat = Cat.create(age:7, enjoys: "eating pickles", image: "https://somecatpic.com")
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age exists in the db entry" do
    cat = Cat.create(name: "Pickles", enjoys: "eating pickles", image: "https://somecatpic.com")
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys exists in the db entry" do
    cat = Cat.create(name: "Pickles", age:7, image: "https://somecatpic.com")
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image exists in the db entry" do
    cat = Cat.create(name: "Pickles", age:7, enjoys: "eating pickles")
    expect(cat.errors[:image]).to_not be_empty
  end

  it "should validate enjoys is at least 10 characters minimum" do
    cat = Cat.create(name:"GuanChan", age:32, enjoys:"pottery and motorcycling", image:"imageOfGuan.jpg")
    expect(cat.errors[:enjoys]).to_not be_empty
  end





end
