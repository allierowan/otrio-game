require "spec_helper"

RSpec.feature "User creates game", type: :feature do
  before do
    Game.delete_all
    Player.delete_all
    PieceSet.delete_all
    Piece.delete_all
  end

  scenario "with 2 players" do
    visit root_path
    select "2", from: "game_number_players"
    click_button "Start Game"
    expect(page).to have_text("purple")
    expect(page).to have_text("green")
    expect(page).to have_text("purple's turn")
  end
end
