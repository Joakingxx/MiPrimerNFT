require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/3o1oTdOW4AqNGqJVRz1Xqkocs-Jr3wfV",
      accounts: [
        "78c7368c6c8e5e7392336a74f9e05a5771ddd247e6435a80aab71237f1b03b4a",
      ],
    },
  },
};
