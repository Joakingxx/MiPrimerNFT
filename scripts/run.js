const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory("MiPrimerNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployerd();
  console.log("Contrato desplegado en: ", nftContract.addres);
};
