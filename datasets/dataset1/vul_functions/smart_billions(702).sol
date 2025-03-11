function calcHashes(uint32 _lastb, uint32 _delta) constant private returns (uint) {
        // <yes> <report> BAD_RANDOMNESS
        return( ( uint(block.blockhash(_lastb  )) & 0xFFFFFF )
        // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+1)) & 0xFFFFFF ) << 24 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+2)) & 0xFFFFFF ) << 48 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+3)) & 0xFFFFFF ) << 72 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+4)) & 0xFFFFFF ) << 96 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+5)) & 0xFFFFFF ) << 120 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+6)) & 0xFFFFFF ) << 144 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+7)) & 0xFFFFFF ) << 168 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+8)) & 0xFFFFFF ) << 192 )
            // <yes> <report> BAD_RANDOMNESS
            | ( ( uint(block.blockhash(_lastb+9)) & 0xFFFFFF ) << 216 )
            | ( ( uint(_delta) / hashesSize) << 240));
    }