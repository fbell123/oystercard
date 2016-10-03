class OysterCard

  MAX = 90
  DEFAULT_BALANCE = 5
  MINIMUM_BALANCE = 1

  attr_reader :balance, :in_journey

  def initialize(balance=DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "TOO MUCH! #{MAX} is the max" if amount + balance > MAX
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey = in_journey
  end

  def touch_in
    fail "Not enough dollar $$$ need £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    in_journey = true
  end

  def touch_out
    in_journey = false
  end

end
