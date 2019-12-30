class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == 'pending'&& sender.valid?
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = 'complete'
    else
      "Transacton rejected. Please check your account balance."
    end
  end

end
