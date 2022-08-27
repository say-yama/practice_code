class Sinsui
  def initialize(card_data=nil)
    if card_data then
      @cards = card_data
      return
    end
    @cards = "-g1-g2-g3-g4-g5-g6-g7-g8-g9-ga-gb-gc-gd"
    @cards << "-h1-h2-h3-h4-h5-h6-h7-h8-h9-ha-hb-hc-hd"
    @cards << "-i1-i2-i3-i4-i5-i6-i7-i8-i9-ia-ib-ic-id"
    @cards << "-j1-j2-j3-j4-j5-j6-j7-j8-j9-ja-jb-jc-jd"
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
    i = card_id*3
    if "-" == @cards[i] then
      @cards[i] = "+"
    end
  end

  def get
    @cards
  end
end