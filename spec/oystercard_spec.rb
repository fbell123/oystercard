require './lib/oystercard'

describe OysterCard do
  subject (:oystercard) {OysterCard.new}

  it 'oyster card has balance' do
    expect(subject.balance).to eq(0)
  end

  it "Oyster card can be topped up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  it "raises error if over max" do
    max = OysterCard::MAX
    subject.top_up(max)
    expect{subject.top_up 1 }.to raise_error("TOO MUCH! #{max} is the max")
  end

end
