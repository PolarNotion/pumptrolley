module GeneratorsHelper
  def commandline_script(generator_id)
    generator = Generator.find(generator_id)
    url       = generator.is_private ? generator_url(format: :rb, token: generator.privacy_token) : generator_url(format: :rb)
    
    "rails new #{@generator.name.parameterize} -m #{url}"
  end
end
