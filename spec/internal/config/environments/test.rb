Rails.application.configure do
  # In order to test that MemoizedInflectorsRails is properly handling
  # reloads of the Rails environment we need to disable class caching.
  # Otherwise our test classes will not be reloaded as desired.
  config.cache_classes = false
end
