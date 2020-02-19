module BrandsHelper
  require 'nkf'

  def japanese
    hiragana = [*"ｱ".."ﾝ"].map{ |chr| NKF.nkf("-h1w", NKF.nkf("-Xw", chr)) }
  end

  def first(brand)
    kana = NKF.nkf("--hiragana -w", brand.name)
    brand_kana = kana.unicode_normalize(:nfd)
  end

  def brandList(brand)
    nav = [
      {name: "FURIMA", path: "/"},
      {name: "ブランド一覧", path: "/brands"}
    ]
    unless brand.nil?
      nav << {name: brand.name, path: "/brands/#{brand.id}"}
    end
    nav
  end
end
