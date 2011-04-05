require 'compass'
require 'compass/app_integration/rails'

environment = Compass::AppIntegration::Rails.env

Compass::AppIntegration::Rails.initialize! if environment != "production"


require 'fileutils'
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))


if environment == 'production'

  Compass::AppIntegration::Rails.initialize!
  
  Rails.configuration.middleware.delete('Sass::Plugin::Rack')
  Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

  Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
      :urls => ['/stylesheets'],
      :root => "#{Rails.root}/tmp")
end



