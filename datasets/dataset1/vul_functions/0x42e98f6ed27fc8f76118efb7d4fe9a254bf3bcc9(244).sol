function close() public onlyOwner {
        selfdestruct(owner); // <LEAKING_VUL>, <SUICIDAL_VUL>
    }