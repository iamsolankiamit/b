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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packages }
    end
 
  end
  def sunburncomingsoon
    redirect_to '/search/vagator-goa'
  end
end
