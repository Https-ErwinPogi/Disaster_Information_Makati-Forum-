class OrderSlackNotifyJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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'
    notifier.ping "user: #{order.user.email}, place order amount #{order.amount}, serial number: #{order.serial_number}"
  end
end
