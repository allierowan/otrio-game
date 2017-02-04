require "spec_helper"

RSpec.describe BoardSpot do
  describe "board spot" do

    it "can generate a css class list" do
      space = BoardSpot.create(x_pos: 1, y_pos: 1, size: "sm")
      expect(space.css_class_list).to eq("board-space sm-space x-1 y-1")
    end

  end
end
