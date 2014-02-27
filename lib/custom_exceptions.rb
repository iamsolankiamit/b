class CustomExceptions < ActionDispatch::PublicExceptions
  
  def call(env)
    status = env["PATH_INFO"][1..-1]

    if "404" == status
      Roomnhouse::Application.routes.call env
    else
      super env
    end
  end

end
