module MasterOfCeremonies
  RESULT = ["司会 大成功！！", "司会 やった", "司会 大失敗..."]

  def preside
    puts RESULT.sample
  end
end

module Singer
  RESULT = ["歌 大成功！！", "歌 やった", "歌 大失敗..."]

  def sing_a_song
    puts RESULT.sample
  end
end

module Acting
  RESULT = ["演技 大成功！！", "演技 やった", "演技 大失敗..."]

  def acting
    puts RESULT.sample
  end
end

module Comte
  RESULT = ["コント 大成功！！", "コント やった", "コント 大失敗..."]

  def comte
    puts RESULT.sample
  end
end

class Talent
  include MasterOfCeremonies
  include Singer
  include Acting
  include Comte

  def initialize
    puts "出演決まったどー！！"
  end

  def multi_talent
    preside
    sing
    acting
    comte
  end

  def mc
    preside
  end

  def singer
    sing_a_song
  end

  def actor
    acting
  end

  def geinin
    comte
  end
end

class Yoshimoto
  MEMBER = ["hamada", "matumoto", "nagasako", "okamura", "yabe", "hotohara"]

  def initialize
    puts "出演依頼　獲ったどー"
  end

  def hamada
    talent = Talent.new
    talent.mc
    talent.singer
    talent.geinin
  end

  def matumoto
    talent = Talent.new
    talent.singer
    talent.geinin
  end

  def nagasako
    talent = Talent.new
    talent.multi_talent
  end

  def okamura
    talent = Talent.new
    talent.mc
    talent.singer
    talent.geinin
  end

  def yabe
    talent = Talent.new
    talent.mc
    talent.actor
    talent.geinin
  end

  def hotohara
    talent = Talent.new
    talent.geinin
  end
end

class TvProgram
  attr_accessor :office, :syutuensha
  #番組制作
  def initialize
    puts "番組制作　はっじまるよー"
  end

  #タレントに出演依頼
  def appearance_request
    puts "だれに出演依頼しよっかなー"
    @office = Yoshimoto.new
  end

  #タレント選ぶ
  def select_talent
    @syutuensha = Yoshimoto::MEMBER.sample
    p "よしっ#{@syutuensha}にきーめたっ！"
  end

  #オンエア
  def on_air
    puts "オンエア 開始！"
    @office.send(:"#{@syutuensha}")
    puts "オンエア終了"
  end
end

tv = TvProgram.new
tv.appearance_request
tv.select_talent
tv.on_air
