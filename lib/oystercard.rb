class OysterCard

  MAX = 90
  DEFAULT_BALANCE = 5
  MINIMUM_BALANCE = 1
  BASIC_FARE = 1

  attr_reader :balance, :in_journey, :station, :journeys

  def initialize(balance=DEFAULT_BALANCE, station = nil)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @station = station
    @journeys = []
    @history = {}
  end

  def top_up(amount)
    fail "TOO MUCH! #{MAX} is the max" if amount + balance > MAX
    @balance += amount
  end

  def in_journey?
    @station != nil
  end

  def touch_in(entry_station)
    fail "Not enough dollar $$$ need £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    @station = entry_station
    @journeys << entry_station
    puts "Touched in at #{entry_station}"
    @station
  end

  def touch_out(exit_station)
    @journeys << exit_station
    deduct(BASIC_FARE)
    @station = nil
    puts "Touched out #{exit_station}"
    write_history
    @station
  end

  def write_history
    @history[journeys[0]] = journeys[1] 
    @journeys.clear
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
