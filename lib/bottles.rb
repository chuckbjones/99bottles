class Bottles
  def song
    verses(FIRSTN, LASTN)
  end

  def verses(firstn, lastn)
    firstn
      .downto(lastn)
      .map { |n| verse(n) }
      .join("\n")
  end

  def verse(n)
    [
      n_bottles_of_beer_on_the_wall(n).capitalize,
      MIDL,
      n_bottles_of_beer(n),
      ENDL,
      take_one_down_pass_it_around(n),
      MIDL,
      n_bottles_of_beer_on_the_wall(nextn(n)),
      ENDL,
    ].join
  end

  private

  FIRSTN = 99
  LASTN = 0
  MIDL = ', '.freeze
  ENDL = ".\n".freeze

  def n_bottles_of_beer_on_the_wall(n)
    "#{n_bottles_of_beer(n)} on the wall"
  end

  def n_bottles_of_beer(n)
    "#{cnt(n)} #{bottles(n)} of beer"
  end

  def take_one_down_pass_it_around(n)
    if last?(n)
      'Go to the store and buy some more'
    else
      "Take #{plural?(n, 'one', 'it')} down and pass it around"
    end
  end

  def bottles(n)
    "bottle#{plural?(n, 's')}"
  end

  def cnt(n)
    last?(n) ? 'no more' : n
  end

  def plural?(n, if_true, if_false = nil)
    (n != 1) ? if_true : if_false
  end

  def nextn(n)
    last?(n) ? FIRSTN : n.pred
  end

  def last?(n)
    n == LASTN
  end
end
