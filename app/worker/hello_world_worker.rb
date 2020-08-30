class HelloWorldWorker < ApplicationJob
  include Sidekiq::Worker

  def perform(*_args)
    puts "Hello World!!!"
  end
end
