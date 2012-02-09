require 'rails'

module Spine
  module Mobile
    module Generators
      class NewGenerator < ::Rails::Generators::Base
        source_root File.expand_path("../templates", __FILE__)
    
        desc "This generator installs Spine #{Spine::Rails::SPINE_VERSION} as part of assets pipeline"
        
        class_option :app, :type => :string, :default => "app", :desc => "app name"
        
        def app_name
          options[:app]
        end
        
        def app_class
          app_name.camelize
        end
            
        def create_dir_layout
          %W{models views controllers lib}.each do |dir|
            empty_directory "app/assets/javascripts/#{app_name}/#{dir}" 
            create_file "app/assets/javascripts/#{app_name}/#{dir}/.gitkeep"
          end
        end
      
        def create_app_file
          template "index.coffee.erb", "app/assets/javascripts/#{app_name}/index.js.coffee"
        end

        def create_default_style_files
          template "index.css.scss", "app/assets/stylesheets/spine_mobile/index.css.scss"
          template "theme.css.scss", "app/assets/stylesheets/spine_mobile/theme.css.scss"
        end

        def create_layout_file
          template "mobile.html.erb", "app/views/layouts/mobile.html.erb"
        end
             
        def add_spine_mobile_app_to_application
          source  = "app/assets/javascripts/application.js"
          content = File.read(source)
          
          if content.include?("//= require_tree .")
            inject_into_file source, :before => "//= require_tree ." do
              "//= require #{app_name}\n"
            end
          else
            append_file source, "\n//= require #{app_name}"
          end
        end

        def add_spine_mobile_styles_to_application
          source  = "app/assets/stylesheets/application.css"
          content = File.read(source)
          
          if content.include?("*= require_tree .")
            inject_into_file source, :before => "*= require_tree ." do
              "*= require_tree ./spine_mobile\n"
            end
          else
            append_file source, "\n*= require_tree ./spine_mobile"
          end
        end
      end
    end
  end
end