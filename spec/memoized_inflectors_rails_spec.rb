require "rails_helper"
require "rails/console/app"

module Reloader
  extend ::Rails::ConsoleMethods  # for `reload!`
end

RSpec.describe MemoizedInflectorsRails do
  it "clears sensitive caches when the Rails environment is reloaded" do
    # Note: DummyService is autoloaded.
    service_class_constantized = "DummyService".constantize
    service_class_safe_constantized = "DummyService".safe_constantize

    # Assert that our preconditions are met.
    aggregate_failures do
      expect(service_class_constantized).to eq(DummyService)
      expect(service_class_safe_constantized).to eq(DummyService)
    end

    # After reloading, any class which was autoloaded through Rails should be
    # redefined. I.e. the DummyService class will be a different object after
    # the reload than it was prior to the reload.
    Reloader.reload!

    # Assert that the class was reloaded (The `DummyService` constant
    # is now a different value than it was before).
    aggregate_failures do
      expect(service_class_constantized).to_not eq(DummyService)
      expect(service_class_safe_constantized).to_not eq(DummyService)
    end

    # #constantize and #safe_constantize should return the newly reloaded
    # class, i.e. their caches should have been cleared of stale values.
    aggregate_failures do
      expect("DummyService".constantize).to eq(DummyService)
      expect("DummyService".safe_constantize).to eq(DummyService)
    end
  end
end
