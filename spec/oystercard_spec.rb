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
    expect(subject.touch_in("Euston")).to eq "Euston"
    expect(subject.touch_out(0)).to eq nil
  end

  it 'expect an error if balance is less than £1 on touch in' do
    minimum = OysterCard::MINIMUM_BALANCE
    subject.touch_out 5
    expect {subject.touch_in("Euston")}.to raise_error("Not enough dollar $$$ need £#{minimum}")
  end

  it 'expect a charge to be deducted on touch out' do
    expect {subject.touch_out(1)}.to change{subject.balance}.by(-1)
  end

  it 'expect station to be recorded on touch in' do
    subject.touch_in("Old Street")
    expect(subject.station).to eq("Old Street")
  end

  it 'true after touch in' do
    subject.touch_in("Euston")
    expect(subject.in_journey?).to eq true
end


end
