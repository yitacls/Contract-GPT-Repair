function selfdestructs() payable public {
    		selfdestruct(owner); // <SUICIDAL_VUL>
    }