function callFirstTarget () public payable onlyPlayers {
	require (msg.value >= 0.005 ether);
	// <yes> <report> UNCHECKED_LL_CALLS
	firstTarget.call.value(msg.value)();
}