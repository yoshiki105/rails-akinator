require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAkinator
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
			g.template_engine :slim
			g.helper false      # ヘルパーを生成しない
			g.assets false      # CSS, JavaScript ファイルを生成しない
			g.skip_routes true  # config/routes.rb を変更しない
			g.test_framework false
		end
  end
end
