require './lib/oystercard'

describe OysterCard do
  subject (:oystercard) {OysterCard.new}

  it 'oyster card has balance' do
    expect(subject.balance).to eq(0)
  end

  it "Oyster card can be topped up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
end
