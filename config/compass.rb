# This configuration file works with both the Compass command line tool and within Rails.
# Require any additional compass plugins here.

project_type = :rails
project_path = Compass::AppIntegration::Rails.root

# Set this to the root of your project when deployed:
http_path = "/"

#css_dir = "public/stylesheets/compiled" if Rails.env != "Production"
# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true


environment = Compass::AppIntegration::Rails.env
#if environment == 'Production'
#  css_dir = "tmp/stylesheets"
#  sass_dir = "app/stylesheets"
#else

css_dir = "public/stylesheets/compiled"
sass_dir = "app/stylesheets"

#end
