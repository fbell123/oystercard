require './lib/oystercard'

describe OysterCard do
  subject (:oystercard) {OysterCard.new}

  it 'oyster card has balance' do
    expect(subject.balance).to eq(5)
  end

  it "Oyster card can be topped up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "raises error if over max" do
    max = OysterCard::MAX
    subject.top_up(85)
    expect{subject.top_up 1 }.to raise_error("TOO MUCH! #{max} is the max")
  end

  it 'deduct journey from balance' do
    subject.touch_out 1
    expect(subject.balance).to eq(4)
  end

  it 'Oyster card in journey' do
    expect(subject.touch_in).to eq true
    expect(subject.touch_out(0)).to eq false
  end

  it 'in journey test' do
    expect(subject.in_journey?).to eq false
  end

  it 'expect an error if balance is less than £1 on touch in' do
    minimum = OysterCard::MINIMUM_BALANCE
    subject.touch_out 5
    expect {subject.touch_in}.to raise_error("Not enough dollar $$$ need £#{minimum}")
  end

  it 'expect a charge to be deducted on touch out' do
    expect {subject.touch_out(1)}.to change{subject.balance}.by(-1)
  end

end
