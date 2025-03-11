function mintToken(uint256 tokensToMint) public onlyOwner 
        {
            if(tokensToMint > 0)
            {
                var totalTokenToMint = tokensToMint * (10 ** 18);
                balanceOf[owner] += totalTokenToMint; // <IO_VUL>
                totalSupply += totalTokenToMint;
                Transfer(0, owner, totalTokenToMint);
            }
        }