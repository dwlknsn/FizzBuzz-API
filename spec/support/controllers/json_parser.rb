module Controllers
  def parsed_response(response)
    JSON.parse(response.body).with_indifferent_access
  end
end
