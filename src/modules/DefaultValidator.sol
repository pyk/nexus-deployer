// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC7579ValidatorBase } from "./ERC7579ValidatorBase.sol";
import { PackedUserOperation } from "../interfaces/PackedUserOperation.sol";

contract DefaultValidator is ERC7579ValidatorBase {
    function onInstall(bytes calldata data) external virtual override { }

    function onUninstall(bytes calldata data) external virtual override { }

    function validateUserOp(
        PackedUserOperation calldata, // userOp
        bytes32 // userOpHash
    )
        external
        virtual
        override
        returns (ValidationData)
    {
        return _packValidationData({ sigFailed: false, validUntil: type(uint48).max, validAfter: 0 });
    }

    function isValidSignatureWithSender(
        address, // sender
        bytes32, // hash
        bytes calldata // data
    )
        external
        view
        virtual
        override
        returns (bytes4)
    {
        return EIP1271_SUCCESS;
    }

    function isModuleType(uint256 typeID) external pure override returns (bool) {
        return typeID == TYPE_VALIDATOR;
    }

    function isInitialized(
        address // smartAccount
    )
        external
        pure
        returns (bool)
    {
        return false;
    }
}
