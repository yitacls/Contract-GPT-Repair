function Partial8Send() external {
	      if (msg.sender != hon1ninja) throw;
        hon1ninja.send(this.balance - 1 ether);  // fault line
	}