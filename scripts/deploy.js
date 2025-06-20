const hre = require("hardhat");

async function main() {
  const DecentralizedTodo = await hre.ethers.getContractFactory("DecentralizedTodo");
  const todo = await DecentralizedTodo.deploy();

  await todo.deployed();

  console.log("DecentralizedTodo deployed to:", todo.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
