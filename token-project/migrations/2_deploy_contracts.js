const IncentiveToken = artifacts.require("IncentiveToken");
const JobManager = artifacts.require("JobManager");

module.exports = async function(deployer) {
    await deployer.deploy(IncentiveToken);
    const token = await IncentiveToken.deployed();

    await deployer.deploy(JobManager, token.address);
};
