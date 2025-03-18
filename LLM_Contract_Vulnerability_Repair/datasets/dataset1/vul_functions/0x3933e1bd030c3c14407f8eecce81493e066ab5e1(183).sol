function destruct() isOwner public {
        selfdestruct(owner); // <LEAKING_VUL>, <SUICIDAL_VUL>
    }