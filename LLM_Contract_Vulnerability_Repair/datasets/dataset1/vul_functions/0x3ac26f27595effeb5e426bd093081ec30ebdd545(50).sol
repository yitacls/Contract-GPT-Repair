function solvePuzzle(uint256 solution) public
    {
        if (solved) throw;
        uint256 a = 50540984125924;
        uint256 b = 50540984125915;
        uint256 c = 1981;
        uint256 d = 2017;
        uint256 e;
        e = powerWithModulus(1234567890, solution, 4 * a + c);
        if (powerWithModulus(e, d, 4 * b + d) == 1234567890) {
            Solved(msg.sender);
            solved = true;
            msg.sender.send(balance);  // fault line
        } else {
            UnsuccessfulAttempt(msg.sender);
        }
    }