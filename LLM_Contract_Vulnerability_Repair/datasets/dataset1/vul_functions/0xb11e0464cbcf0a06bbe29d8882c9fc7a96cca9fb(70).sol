function AddTicket() public payable
    {
        require(msg.value == ticketPrice);
        require(numtickets < maxTickets);
        lastTicketTime = now;
        totalBounty += ticketPrice;  // fault line
        bool success = numtickets == maxTickets;
        NewTicket(msg.sender, success);
        if(success)
        {
            PayWinner(msg.sender);
        }
    }