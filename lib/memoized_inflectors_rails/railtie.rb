require "rails"

module MemoizedInflectorsRails
  class Railtie < Rails::Railtie # :nodoc:
    config.memoized_inflectors_reload_caches = %i[constantize safe_constantize]

    config.to_prepare do
      ::MemoizedInflectors.clear_cache(
        *Rails.application.config.memoized_inflectors_reload_caches
      )
    end
  end
end
