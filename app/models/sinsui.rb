class Sinsui
  def initialize(card_data=nil)
    @opend = Array.new

    if card_data then
      data = card_data.split(";")
      @cards = data[0]
      @opend << data[1].to_i if data[1]
      @opend << data[2].to_i if data[2]
      return
    end

    @cards = "-g1-g2-g3-g4-g5-g6-g7-g8-g9-ga-gb-gc-gd"
    @cards << "-h1-h2-h3-h4-h5-h6-h7-h8-h9-ha-hb-hc-hd"
    @cards << "-i1-i2-i3-i4-i5-i6-i7-i8-i9-ia-ib-ic-id"
    @cards << "-j1-j2-j3-j4-j5-j6-j7-j8-j9-ja-jb-jc-jd"

    # シャッフル
    for no in 0...size do
      i = no * 3
      j = Random.rand(size) * 3
      if i != j then
        @cards[i,3], @cards[j,3] = @cards[j, 3], @cards[i, 3]
      end
    end
  end

  def size
    @cards.size/3
  end

  def image(card_id)
    i = card_id*3
    if "-" == @cards[i] then
      "cards/ura_r.png"
    else
      "cards/"+@cards[i+1,2]+".png"
    end
  end

  def open(card_id)
    if 0 == @cards.count("-")then
      return 4
    end

    if 2 == @opend.size then
      @cards[@opend[0]] = "-"
      @cards[@opend[1]] = "-"
      @opend.clear
      return 5
    end

    i = card_id*3
    if "-" == @cards[i] then
      @cards[i] = "+"
      @opend << i
      if 2 == @opend.size then
        if @cards[@opend[0]+2] == @cards[i+2] then
          @opend.clear
          if 0 == @cards.count("-") then
            return 4
          else
            return 3
          end
        else
          return 2
        end
      end

      return 1
    end

    return 0 - @opend.size
  end

  def get
    @cards +
    (@opend[0]?(";"+@opend[0].to_s):"") +
    (@opend[1]?(";"+@opend[1].to_s):"")
  end
end