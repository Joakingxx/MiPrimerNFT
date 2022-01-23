const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory("MiPrimerNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployerd();
  console.log("Contrato desplegado en: ", nftContract.addres);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
