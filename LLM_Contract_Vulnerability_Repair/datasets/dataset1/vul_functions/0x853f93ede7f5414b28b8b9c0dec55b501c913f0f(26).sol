function _transfer(address _from, address _to, uint _value) internal {    
if(_to == 0x0) revert();
if(balances[_from] < _value) revert(); 
if(balances[_to] + _value < balances[_to]) revert();
uint PreviousBalances = balances[_from] + balances[_to];  // fault line
balances[_from] -= _value;
balances[_to] += _value; 
assert(balances[_from] + balances[_to] == PreviousBalances);  
emit Transfer(_from, _to, _value); 
}