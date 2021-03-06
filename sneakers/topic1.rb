require File.expand_path('../boot.rb', __FILE__)

# * 只允许一个
# # 0个，一个，多个
class Processor
  include Sneakers::Worker
  from_queue :topic1,
             exchange: 'logs_exchange',
             exchange_type: :topic,
             routing_key: 'error.*'

  def work(msg)
    puts "topic 1 #{msg}"

    ack!
  end
end

# sneakers work Processor --require sneakers/topic1.rb
