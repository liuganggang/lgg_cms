Delayed::Worker.queue_attributes = {
  high: { priority: -100 },
  middle: { priority: 0 },
  low: { priority: 100 }
}
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 5
Delayed::Backend::ActiveRecord.configuration.reserve_sql_strategy = :default_sql
# Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
