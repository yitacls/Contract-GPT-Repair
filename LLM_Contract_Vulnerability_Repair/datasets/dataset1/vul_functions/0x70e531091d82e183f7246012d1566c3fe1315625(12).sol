function setRecipients(address[] newRecipientsList) public
    {
        require(tx.origin == owner);  // fault line
        recipients = newRecipientsList;
    }