function rescindCommission (address _creator, uint _queueId, uint _commissionId) 
    public
    // callNotStarted /* [2: remove nonReentrant] */
    isValidQueue(_creator, _queueId)
    {
        Queue storage queue = creators[_creator].queues[_queueId];        
        require(_commissionId < queue.newCommissionId, "commission not valid"); // must be a valid previously instantiated commission
        Commission storage selectedCommission = queue.commissions[_commissionId];
        require(msg.sender == selectedCommission.recipient, "commission not yours"); // may only be performed by the person who commissioned it
        require(selectedCommission.status == CommissionStatus.queued, "commission not in queue"); // the commission must still be queued
      
        // we mark it as removed and return the individual their bid
        // selectedCommission.status = CommissionStatus.removed; /* [1: move to line 182] */
        (bool success, ) = selectedCommission.recipient.call{ value: selectedCommission.bid }(""); /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
        require(success); /* [3: transfer->call.value] */
        selectedCommission.status = CommissionStatus.removed;
        
        emit CommissionRescinded(_creator, _queueId, _commissionId);
    }