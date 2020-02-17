class BrandsController < ApplicationController
  def index
    @hiragana = japanese
    @brands = Brand.all
  end

  def japanese
    require 'nkf'
    hiragana = [*"ｱ".."ﾝ"].map{ |chr| NKF.nkf("-h1w", NKF.nkf("-Xw", chr)) }
    return hiragana
  end
end
