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

  def reject_transfer
    sender.valid?
    "Transacton rejected. Please check your account balance."
  end

  def execute_transaction
    if self.status == 'pending'
      sender.balance -= @amount
      receiver.balance += @amount
    else
      reject_transfer
    end
  end
end
