function isIco() constant public returns (bool ico) {
		 bool result=((icoStart+(35*24*60*60)) >= now);  // fault line
		 if(enableIco){
		     return true;
		 }
		 else{
		     return result;
		 }
	}