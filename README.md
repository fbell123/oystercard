# Oyster Card


## Team wildcat smashed it today.

Worked through exercise 13, completing all tests along the journey.

History of journeys saved after touch_out, oystercards charged on
touch_in, all seems to work pretty well.

```
[1] pry(main)> require './lib/oystercard'
=> true
[2] pry(main)> card = OysterCard.new
=> #<OysterCard:0x007f9f11a41818 @balance=5, @history={}, @in_journey=false, @journeys=[], @station=nil>
[3] pry(main)> card.touch_in("AB")
Touched in at AB
=> nil
[4] pry(main)> card.touch_out("CD")
Touched out CD
=> nil
[5] pry(main)> card
=> #<OysterCard:0x007f9f11a41818 @balance=4, @history={"AB"=>"CD"}, @in_journey=false, @journeys=[], @station=nil>
[6] pry(main)>
```


***Killed it***
