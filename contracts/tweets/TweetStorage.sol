// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '../helpers/BaseStorage.sol';

contract TweetStorage is BaseStorage {

  struct Tweet {
    uint id;
    string text;
    uint userId;
    uint postedAt;
  }

  mapping(uint => Tweet) public tweets;

  uint latestTweetId = 0;

  function createTweet(uint _userId, string memory _text) public onlyController returns(uint) {
    latestTweetId++;
    tweets[latestTweetId] = Tweet(latestTweetId, _text, _userId, block.timestamp);
    return latestTweetId;
  }
}