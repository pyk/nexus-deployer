// // SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/// @dev Deploys contracts using CREATE and CREATE2
contract BytecodeDeployer {
    /// @notice Deploys a contract using CREATE, reverts on failure
    function deploy(bytes memory creationBytecode) internal returns (address contractAddress) {
        assembly {
            contractAddress := create(0, add(creationBytecode, 0x20), mload(creationBytecode))
        }
        require(contractAddress != address(0), "BytecodeDeployer: deployment failed");
    }

    /// @notice Deploys a contract using CREATE2, reverts on failure
    function deploy2(bytes memory creationBytecode, bytes32 salt) internal returns (address contractAddress) {
        assembly {
            contractAddress := create2(0, add(creationBytecode, 0x20), mload(creationBytecode), salt)
        }
        require(contractAddress != address(0), "BytecodeDeployer: deployment failed");
    }
}
