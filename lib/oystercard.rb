class OysterCard

  MAX = 90
  DEFAULT_BALANCE = 5
  MINIMUM_BALANCE = 1

  attr_reader :balance, :in_journey, :station

  def initialize(balance=DEFAULT_BALANCE, station = nil)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @station = station
  end

  def top_up(amount)
    fail "TOO MUCH! #{MAX} is the max" if amount + balance > MAX
    @balance += amount
  end

  def in_journey?
    @in_journey = in_journey
  end

  def touch_in(entry_station)
    fail "Not enough dollar $$$ need £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    @station = entry_station
    in_journey = true
  end

  def touch_out(amount)
    deduct(amount)
    in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
