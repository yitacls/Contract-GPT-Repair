function destroycontract(address _to) {

        selfdestruct(_to); // <SUICIDAL_VUL>, <LEAKING_VUL>

    }