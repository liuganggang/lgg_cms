require 'test_helper'

class DataCleanJobTest < ActiveJob::TestCase
  test "data is clean" do
    DataCleanJob.perform_now('data1')
    # assert account.reload.charged_for?(product)
    assert true
  end

  test 'data clean job scheduling' do
    assert_enqueued_with(job: DataCleanJob) do
      DataCleanJob.perform_later('data1')
    end
  end
end
