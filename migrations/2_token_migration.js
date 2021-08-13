const SphereToken = artifacts.require("SphereToken");

module.exports = function (deployer) {
  deployer.deploy(SphereToken);
};
