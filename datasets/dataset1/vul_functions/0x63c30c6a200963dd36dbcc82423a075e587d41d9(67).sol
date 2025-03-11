function Refund_user() payable {
        require(refund_balance[1]==0 || fair);
        address current__user_ = msg.sender;
        if(fair || current__user_ == msg.sender) {
            pay_user__ += msg.value;  // fault line
            raised +=msg.value;  
        }
    }