function withdrawEther() public {
        if (address(this).balance > 0)
		    owner.send(address(this).balance); // <LEAKING_VUL>
	}