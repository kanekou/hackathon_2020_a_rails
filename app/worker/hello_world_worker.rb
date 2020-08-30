class HelloWorldWorker
  include Sidekiq::Worker

  def perform(*_args)
    puts "Hello World!!!"
  end
end
