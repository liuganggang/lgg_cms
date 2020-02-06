class DataCleanJob < ApplicationJob
  queue_as :middle

  before_enqueue :find_data
  after_perform :notice_me

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    # Do something with the exception
    puts "rescue_from Data not found!"
  end

  # retry_on CustomAppException # defaults to 3s wait, 5 attempts

  # GlobalID 队列对象如果执行前被删除, 会抛出DeserializationError 异常
  # 跳过这类异常
  discard_on ActiveJob::DeserializationError

  # DataCleanJob.set(wait: 1.minute).perform_later(data1)
  def perform(*data)
    # Do something later
    puts "perform Data Cleanup!"
  end

  private

  def find_data
    puts "before_enqueue find data"
  end

  def notice_me
    puts "after_perform Clean up!"
  end
end
