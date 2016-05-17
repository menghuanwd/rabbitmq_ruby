require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker
  from_queue :topic2,
              exchange: 'i_am_topic',
              exchange_type: :topic,
              routing_key: 'topic.#'

  def work(msg)
    puts "topic 2 #{msg}"

    ack!
  end
end