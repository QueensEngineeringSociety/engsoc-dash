# frozen_string_literal: true

module EnvironmentVariablesExample
  class Application < Rails::Application
    # https://richonrails.com/articles/environment-variables-in-ruby-on-rails

    config.before_configuration do
      env_file = Rails.root.join('config', 'environment_variables.yml').to_s

      if File.exist?(env_file)
        YAML.load_file(env_file)[Rails.env].each do |key, value|
          ENV[key.to_s] = value
        end # end YAML.load_file
      end # end if File.exists?
    end # end config.before_configuration
  end # end class
end # end module
