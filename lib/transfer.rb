class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  # your code here
  def initialize(sender, receiver, amnt)
    @sender=sender
    @receiver=receiver
    @amount=amnt
    @status="pending"
  end
  def  valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
     if self.both_valid? && self.status != "complete" && @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
       self.status = "complete"
     else
       self.reject_transfer
     end
  end

  def reverse_transfer
if @status == "complete"
          receiver.balance -= @amount
       sender.balance += @amount
       @status="reversed"
     end

end
end
