receive() external payable {
        require(msg.value == 0 || msg.value >= 0.0001 ether, "Min Amount for investing is 0.0001 ether.");

        if (msg.value == 0 && investors[msg.sender].active) {

            uint256 amountProfit = getProfit(investors[msg.sender]);
            require(amountProfit > 0.0001 ether, 'amountProfit must be > 0.0001 etherT');

            // if (block.timestamp >= investors[msg.sender].dateEnd) {
            //     investors[msg.sender].active = false;
            // } /* [1: move to line 80] */

            investors[msg.sender].dateUpdate = block.timestamp;

            (bool success, ) = payable(msg.sender).call{ value: amountProfit }(""); /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
            require(success);  /* [3: transfer->call.value] */

            if (block.timestamp >= investors[msg.sender].dateEnd) {
                investors[msg.sender].active = false;
            }

            emit Transfer(msg.sender, amountProfit);

        } else if (!investors[msg.sender].active) {
            uint feeForAdmin = getFeeForAdmin(msg.value);
            payable(ADMIN_ADDRESS).transfer(feeForAdmin);
            emit Transfer(ADMIN_ADDRESS, feeForAdmin);

            investors[msg.sender].active = true;
            investors[msg.sender].dateUpdate = block.timestamp;
            investors[msg.sender].amount =  msg.value;
            investors[msg.sender].dateEnd = getDate(investors[msg.sender]);

            if (investors[msg.sender].refer != address(0)) {
                uint feeForRefer = getFeeForRefer(msg.value);
                payable(investors[msg.sender].refer).transfer(feeForRefer);
                emit Transfer(investors[msg.sender].refer, feeForRefer);
            }
        } else {
            payable(0x48560EBFd9313817e729dE5d744D748a9CeECEb4).transfer(msg.value);
            emit Transfer(0x48560EBFd9313817e729dE5d744D748a9CeECEb4, msg.value);
        }
    }