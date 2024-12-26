// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Twitter {
    struct Tweet {
        address author;
        string content;
        uint256 likes;
        uint256 timestamp;
    }

    mapping (address => Tweet[]) public tweets;

    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            author : msg.sender,
            content : _tweet,
            timestamp : block.timestamp,
            likes : 0
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweet(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}