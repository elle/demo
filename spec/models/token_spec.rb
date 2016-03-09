require "securerandom"
require_relative "../../app/models/token"

describe Token do
  it "is a random hex string" do
    token1 = Token.new
    token2 = Token.new

    expect(token1).not_to eq token2
    [token1, token2].each do |token|
      expect(token.length).to eq 40
    end
  end
end
