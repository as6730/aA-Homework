require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Alexandra") }

  describe "#initialize" do
    subject(:cupcakes) { Dessert.new("cupcakes", 25, chef) }

    it "sets a type" do
      expect(cupcakes.type).to eq("cupcakes")
    end

    it "sets a quantity" do
      expect(cupcakes.quantity).to eq(25)
    end

    it "starts ingredients as an empty array" do
      expect(cupcakes.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cupcakes", "a lot", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cupcakes.ingredients).to_not include("sugar")
      dessert.add_ingredient("sugar")
      expect(cupcake.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["vanilla", "eggs", "flour", "butter", "sugar"]

      ingredients.each do |ingredient|
        cupcakes.add_ingredient(ingredient)

        expect(cupcakes.ingredients).to eq(ingredients)
        cupcakes.mix!
        expect(cupcakes.ingredients).not_to eq(ingredients)
        expect(cupcakes.ingredients.sort).to eq(ingredients.sort)
      end
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(chef).receive(:eat).with(3)
      chef.eat(3)
      expect(cupcakes).to eq(22)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cupcakes.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:capitalize).and_return("Chef Alexandra the Great Baker")
      expect(cupcakes.serve).to eq("Chef Alexandra the Great Baker has made 25 cupcakes!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).receive(:bake).with(cupcakes)
      cupcakes.make_more
    end
  end
end
