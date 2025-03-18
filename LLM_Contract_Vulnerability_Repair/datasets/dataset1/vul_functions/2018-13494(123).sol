function mintToken(address target, uint256 initialSupply) public{
        balanceOf[target] += initialSupply; // <IO_VUL>
        totalSupply += initialSupply;
        Transfer(0, msg.sender, initialSupply);
        Transfer(msg.sender, target,initialSupply);

    }