module ControllerSpecHelper
  def json
    JSON.parse(response.body)
  end

  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def set_headers
    {
      "Authorization" => token_generator(user.id),
      "Content-Type" => "application/json",
      "Accept" => "application/vnd.bucketlists.v1+json"
    }
  end
end