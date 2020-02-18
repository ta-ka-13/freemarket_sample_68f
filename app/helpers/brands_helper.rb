module BrandsHelper
  require 'nkf'

  def japanese
    hiragana = [*"ｱ".."ﾝ"].map{ |chr| NKF.nkf("-h1w", NKF.nkf("-Xw", chr)) }
  end

  def first(brand)
    kana = NKF.nkf("--hiragana -w", brand.name)
    brand_kana = kana.unicode_normalize(:nfd)
  end
end
