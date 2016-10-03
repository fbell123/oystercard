require './lib/oystercard'

describe OysterCard do
  subject (:oystercard) {OysterCard.new}

  let (:station) {double :station}

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
    subject.touch_out(:station)
    expect(subject.balance).to eq(4)
  end

  it 'expect an error if balance is less than £1 on touch in' do
    minimum = OysterCard::MINIMUM_BALANCE
    5.times {subject.touch_out(:station)}
    expect {subject.touch_in(:station)}.to raise_error("Not enough dollar $$$ need £#{minimum}")
  end

  it 'expect a charge to be deducted on touch out' do
    fare = OysterCard::BASIC_FARE
    expect {subject.touch_out(:station)}.to change{subject.balance}.by(-1)
  end

  it 'expect station to be recorded on touch in' do
    subject.touch_in(:station)
    expect(subject.journeys[0]).to eq(:station)
  end

  it 'true after touch in' do
    subject.touch_in(:station)
    expect(subject.in_journey?).to eq true
  end

  it 'checks no journeys at touch in' do
    expect(@journeys).to eq nil
  end

  it 'creates a journey from touch in to touch out' do
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect(subject.view_history.count).to eq 1
  end

end
