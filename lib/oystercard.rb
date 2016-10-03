class OysterCard
  MAX = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "TOO MUCH! #{MAX} is the max" if amount + balance > MAX
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
