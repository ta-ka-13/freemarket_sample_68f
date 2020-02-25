module BrandsHelper
  require 'nkf'

  def japanese
    hiragana = [*"ｱ".."ﾝ"].map{ |chr| NKF.nkf("-h1w", NKF.nkf("-Xw", chr)) }
  end

  def first(brand)
    kana = NKF.nkf("--hiragana -w", brand)
    brand_kana = kana.unicode_normalize(:nfd)
  end

  def brandNav
    nav = [
      {name: "FURIMA", path: "/"},
      {name: "ブランド一覧", path: "/brands"}
    ]
  end

  def brandList(item)
    brandNav << {name: item.brand, path: "/brands/#{item.brand}"}
  end
end
