require 'rails_helper'

describe Todo do
  describe "validation methods" do

    before do
      @first_todo = Todo.new(description: "buy a milkshake")
      @second_todo = Todo.new
    end

    describe '#valid?' do
      it "requires the presence of a description" do
        expect(@first_todo.save).to eq(true)
        expect(@second_todo.save).to eq(false)
      end   
    end
  end
end
