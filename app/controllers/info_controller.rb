class InfoController < ApplicationController
  def support
  end

  def terms
  end

  def cancellation
  end

  def privacy
  end

  def howtohost

  end
  def whyhost

  end
  def dabbadrive

  end
  def sunburn
    @package1 = Package.find(3)
    @package1offer = Offer.find("wx1k7g")
    @package2 = Package.find(4)
    @package2offer = Offer.find("pwpjzg")
    @package3 = Package.find(5)
    @package3offer = Offer.find("nt7ggg")
    @package4 = Package.find(6)
    @package4offer = Offer.find("p7mfvg")
    @package5 = Package.find(7)
    @package5offer = Offer.find("8h58ag")
    @package6 = Package.find(8)
    @package6offer = Offer.find("mct5zg")
    @package7 = Package.find(9)
    @package7offer = Offer.find("qybczg")
    @package8 = Package.find(10)
    @package8offer = Offer.find("47r5qg")
    @package9 = Package.find(11)
    @package9offer = Offer.find("fs31fg")
    @package10 = Package.find(12)
    @package10offer = Offer.find("1a4q5g")
    @package11 = Package.find(13)
    @package11offer = Offer.find("9j0rng")
    @package12 = Package.find(14)
    @package12offer = Offer.find("c1knfg")
    @package13 = Package.find(15)
    @package13offer = Offer.find("yx6mhg")
    @package14 = Package.find(16)
    @package14offer = Offer.find("9fqnyg")
    @package15 = Package.find(17)
    @package15offer = Offer.find("s1w23g")
    @package16 = Package.find(18)
    @package16offer = Offer.find("j2ycqg")
    @package17 = Package.find(19)
    @package17offer = Offer.find("dfjhkg")

    respond_to do |format|
      format.html { render layout: false}
      format.json { render json: @packages }
    end

  end
  def sunburncomingsoon
    redirect_to '/search/vagator-goa'
  end
  def carhire
  end
end
